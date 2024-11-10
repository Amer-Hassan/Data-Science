use sakila;
Drop Table if Exists Company;

Create Table Company (
Ticker VARCHAR(4) Primary Key,
Company VARCHAR(40) UNIQUE NOT NULL,
Fiscal_Year_End INT,
Morningstar_Size Char(7) Check (Morningstar_Size in ('Small','Medium','Large')),
Morningstar_Style Char(7) Check (Morningstar_Style in ('Value', 'Growth')),
Sector VARCHAR(40),
Industry VARCHAR(40)
);

Insert into Company
Select * from company_src;

ALTER TABLE META_income
MODIFY COLUMN Income_category INT;
select income_category from Meta_income;

Drop Table if Exists Income;

Create Table Income (
Ticker VARCHAR(4),
Year INT,
Revenue DECIMAL(18, 2),
Operating_Income DECIMAL(18, 2),
Net_Income DECIMAL(18, 2),
Basic_EPS DECIMAL(18, 2),
Diluted_EPS DECIMAL(18, 2),
Basic_WASO DECIMAL(18, 2),
Diluted_WASO DECIMAL(18, 2),
PRIMARY KEY (Ticker, Year)
);


INSERT INTO Income (Ticker, Year, Revenue, Operating_Income, Net_Income, Basic_EPS, Diluted_EPS, Basic_WASO, Diluted_WASO)
VALUES
('Meta', 2013, 7872000000, 2804000000, 1491000000, 0.62, 0.6, 2420000019, 2517000020),
('Meta', 2014, 12466000000, 4994000000, 2925000000, 1.12, 1.1, 2614000020, 2664000021),
('Meta', 2015, 17928000000, 6225000000, 3669000000, 1.31, 1.29, 2803000022, 2853000022),
('Meta', 2016, 27638000000, 12427000000, 10188000000, 3.56, 3.49, 2863000022, 2925000023),
('Meta', 2017, 40653000000, 20203000000, 15920000000, 5.49, 5.39, 2901000023, 2956000023),
('Meta', 2018, 55838000000, 24913000000, 22111000000, 7.65, 7.57, 2890000023, 2921000023),
('Meta', 2019, 70697000000, 23986000000, 18485000000, 6.48, 6.43, 2854000022, 2876000023),
('Meta', 2020, 85965000000, 32671000000, 29146000000, 10.22, 10.09, 2851000000, 2888000000),
('Meta', 2021, 117929000000, 46753000000, 39370000000, 13.99, 13.77, 2815000000, 2859000000),
('Meta', 2022, 116609000000, 28944000000, 29734000000, 8.63, 8.59, 2687000000, 2702000000);

INSERT INTO Income (Ticker, Year, Revenue, Operating_Income, Net_Income, Basic_EPS, Diluted_EPS, Basic_WASO, Diluted_WASO)
VALUES
('AMZN', 2013, 74452000000, 745000000, 274000000, 0.03, 0.03, 9140000000, 9300000000),
('AMZN', 2014, 88988000000, 178000000, -241000000, -0.03, -0.03, 9240000000, 9240000000),
('AMZN', 2015, 107006000000, 2233000000, 596000000, 0.06, 0.06, 9340000000, 9540000000),
('AMZN', 2016, 135987000000, 4186000000, 2371000000, 0.25, 0.24, 9480000000, 9680000000),
('AMZN', 2017, 177866000000, 4106000000, 3033000000, 0.32, 0.31, 9600000000, 9860000000),
('AMZN', 2018, 232887000000, 12421000000, 10073000000, 1.03, 1.01, 9740000000, 10000000000),
('AMZN', 2019, 280522000000, 14541000000, 11588000000, 1.17, 1.15, 9880000000, 10080000000),
('AMZN', 2020, 386064000000, 22899000000, 21331000000, 2.13, 2.09, 10000000000, 10200000000),
('AMZN', 2021, 469822000000, 24879000000, 33364000000, 3.3, 3.24, 10120000000, 10300000000),
('AMZN', 2022, 513983000000, 12248000000, -2722000000, -0.27, -0.27, 10189000000, 10189000000),
('AMZN', 2023, 554028000000, 26380000000, 20079000000, 1.95, 1.91, 10270000000, 10394500000);

INSERT INTO Income (Ticker, Year, Revenue, Operating_Income, Net_Income, Basic_EPS, Diluted_EPS, Basic_WASO, Diluted_WASO)
VALUES 
('TSLA', 2013, 2013496000.00, -61283000.00, -74014000.00, -0.04, -0.04, 1791321210.00, 1791321210.00),
('TSLA', 2014, 3198356000.00, -186689000.00, -294040000.00, -0.16, -0.16, 1868090145.00, 1868090145.00),
('TSLA', 2015, 4046025000.00, -716629000.00, -888663000.00, -0.46, -0.46, 1923030000.00, 1923030000.00),
('TSLA', 2016, 7000132000.00, -667340000.00, -674914000.00, -0.31, -0.31, 2163180000.00, 2163180000.00),
('TSLA', 2017, 11758751000.00, -1632086000.00, -1961400000.00, -0.79, -0.79, 2486370000.00, 2486370000.00),
('TSLA', 2018, 21461268000.00, -252840000.00, -976091000.00, -0.38, -0.38, 2557875000.00, 2557875000.00),
('TSLA', 2019, 24578000000.00, 80000000.00, -862000000.00, -0.33, -0.33, 2655000000.00, 2655000000.00),
('TSLA', 2020, 31536000000.00, 1994000000.00, 690000000.00, 0.25, 0.21, 2799000000.00, 3249000000.00),
('TSLA', 2021, 53823000000.00, 6496000000.00, 5519000000.00, 1.87, 1.63, 2958000000.00, 3387000000.00),
('TSLA', 2022, 81462000000.00, 13832000000.00, 12583000000.00, 4.02, 3.62, 3130000000.00, 3475000000.00),
('TSLA', 2023, 95924000000.00, 10762000000.00, 10794000000.00, 3.41, 3.1, 3168250000.00, 3480250000.00);

INSERT INTO Income (Ticker, Year, Revenue, Operating_Income, Net_Income, Basic_EPS, Diluted_EPS, Basic_WASO, Diluted_WASO)
VALUES 
('SBUX', 2013, 14892200000.00, 2207300000.00, 8300000.00, 0.01, 0.01, 1498600000.00, 1524600000.00),
('SBUX', 2014, 16447800000.00, 2792600000.00, 2068100000.00, 1.38, 1.35, 1506200000.00, 1526200000.00),
('SBUX', 2015, 19162700000.00, 3351100000.00, 2757400000.00, 1.84, 1.82, 1495900000.00, 1513400000.00),
('SBUX', 2016, 21315900000.00, 3853700000.00, 2817700000.00, 1.91, 1.9, 1471600000.00, 1486700000.00),
('SBUX', 2017, 22386800000.00, 3896800000.00, 2884700000.00, 1.99, 1.97, 1449500000.00, 1461500000.00),
('SBUX', 2018, 24719500000.00, 3806500000.00, 4518300000.00, 3.27, 3.24, 1382700000.00, 1394600000.00),
('SBUX', 2019, 26508600000.00, 3915700000.00, 3599200000.00, 2.95, 2.92, 1221200000.00, 1233200000.00),
('SBUX', 2020, 23518000000.00, 1517900000.00, 928300000.00, 0.79, 0.79, 1172800000.00, 1181800000.00),
('SBUX', 2021, 29060600000.00, 4657200000.00, 4199300000.00, 3.57, 3.54, 1177600000.00, 1185500000.00),
('SBUX', 2022, 32250300000.00, 4429700000.00, 3281600000.00, 2.85, 2.83, 1153300000.00, 1158500000.00),
('SBUX', 2023, 35016200000.00, 5056100000.00, 3783500000.00, 3.3, 3.28, 1147525000.00, 1152125000.00);

INSERT INTO Income (Ticker, Year, Revenue, Operating_Income, Net_Income, Basic_EPS, Diluted_EPS, Basic_WASO, Diluted_WASO)
VALUES 
('QCOM', 2014, 26487000000.00, 7550000000.00, 7967000000.00, 4.73, 4.65, 1683000000.00, 1714000000.00),
('QCOM', 2015, 25281000000.00, 5776000000.00, 5271000000.00, 3.26, 3.22, 1618000000.00, 1639000000.00),
('QCOM', 2016, 23554000000.00, 6495000000.00, 5705000000.00, 3.84, 3.81, 1484000000.00, 1498000000.00),
('QCOM', 2017, 22291000000.00, 2614000000.00, 2466000000.00, 1.67, 1.65, 1477000000.00, 1490000000.00),
('QCOM', 2018, 22732000000.00, 742000000.00, -4864000000.00, -3.32, -3.32, 1463000000.00, 1463000000.00),
('QCOM', 2019, 24273000000.00, 7667000000.00, 4386000000.00, 3.63, 3.59, 1210000000.00, 1220000000.00),
('QCOM', 2020, 23531000000.00, 6255000000.00, 5198000000.00, 4.58, 4.52, 1135000000.00, 1149000000.00),
('QCOM', 2021, 33566000000.00, 9789000000.00, 9043000000.00, 7.99, 7.87, 1131000000.00, 1149000000.00),
('QCOM', 2022, 44200000000.00, 15860000000.00, 12936000000.00, 11.52, 11.37, 1123000000.00, 1137000000.00),
('QCOM', 2023, 35820000000.00, 7788000000.00, 7232000000.00, 6.47, 6.42, 1117000000.00, 1126000000.00),
('QCOM', 2024, 35820000000.00, 7788000000.00, 7232000000.00, 6.47, 6.42, 1117000000.00, 1126000000.00);

INSERT INTO Income (Ticker, Year, Revenue, Operating_Income, Net_Income, Basic_EPS, Diluted_EPS, Basic_WASO, Diluted_WASO)
VALUES 
('APPL', 2014, 182795000000.00, 52503000000.00, 39510000000.00, 1.62, 1.61, 24342288000.00, 24490652000.00),
('APPL', 2015, 233715000000.00, 71230000000.00, 53394000000.00, 2.32, 2.31, 23013684000.00, 23172276000.00),
('APPL', 2016, 215639000000.00, 60024000000.00, 45687000000.00, 2.09, 2.08, 21883280000.00, 22001124000.00),
('APPL', 2017, 229234000000.00, 61344000000.00, 48351000000.00, 2.32, 2.3, 20868968000.00, 21006768000.00),
('APPL', 2018, 265595000000.00, 70898000000.00, 59531000000.00, 3.00, 2.98, 19821508000.00, 20000436000.00),
('APPL', 2019, 260174000000.00, 63930000000.00, 55256000000.00, 2.99, 2.97, 18471336000.00, 18595652000.00),
('APPL', 2020, 274515000000.00, 66288000000.00, 57411000000.00, 3.31, 3.28, 17352119000.00, 17528214000.00),
('APPL', 2021, 365817000000.00, 108949000000.00, 94680000000.00, 5.67, 5.61, 16701272000.00, 16864919000.00),
('APPL', 2022, 394328000000.00, 119437000000.00, 99803000000.00, 6.15, 6.11, 16215963000.00, 16325819000.00),
('APPL', 2023, 383285000000.00, 114301000000.00, 96995000000.00, 6.16, 6.13, 15744231000.00, 15812547000.00),
('APPL', 2024, 383285000000.00, 114301000000.00, 96995000000.00, 6.16, 6.13, 15744231000.00, 15812547000.00);

INSERT INTO Income (Ticker, Year, Revenue, Operating_Income, Net_Income, Basic_EPS, Diluted_EPS, Basic_WASO, Diluted_WASO)
VALUES 
('NFLX', 2013, 4374562000.00, 228347000.00, 112403000.00, 0.28, 0.26, 407386000.00, 425327000.00),
('NFLX', 2014, 5504656000.00, 402648000.00, 266799000.00, 0.63, 0.62, 420546000.00, 431893000.00),
('NFLX', 2015, 6779511000.00, 305826000.00, 122641000.00, 0.29, 0.28, 425889000.00, 436456000.00),
('NFLX', 2016, 8830669000.00, 379793000.00, 186678000.00, 0.44, 0.43, 428822000.00, 438652000.00),
('NFLX', 2017, 11692713000.00, 838679000.00, 558929000.00, 1.29, 1.25, 431885000.00, 446814000.00),
('NFLX', 2018, 15794341000.00, 1605226000.00, 1211242000.00, 2.78, 2.68, 435374000.00, 451244000.00),
('NFLX', 2019, 20156447000.00, 2604254000.00, 1866916000.00, 4.26, 4.13, 437799000.00, 451765000.00),
('NFLX', 2020, 24996056000.00, 4585289000.00, 2761395000.00, 6.26, 6.08, 440922000.00, 454208000.00),
('NFLX', 2021, 29697844000.00, 6194509000.00, 5116228000.00, 11.55, 11.24, 443155000.00, 455372000.00),
('NFLX', 2022, 31615550000.00, 5632831000.00, 4491924000.00, 10.1, 9.95, 444698000.00, 451290000.00),
('NFLX', 2023, 32742525000.00, 6007798000.00, 4525436000.00, 10.2, 10.02, 443956250.00, 451403250.00);

INSERT INTO Income (Ticker, Year, Revenue, Operating_Income, Net_Income, Basic_EPS, Diluted_EPS, Basic_WASO, Diluted_WASO)
VALUES 
('MFST', 2014, 86833000000.00, 27886000000.00, 22074000000.00, 2.66, 2.63, 8299000000.00, 8399000000.00),
('MFST', 2015, 93580000000.00, 28172000000.00, 12193000000.00, 1.49, 1.48, 8177000000.00, 8254000000.00),
('MFST', 2016, 85320000000.00, 21292000000.00, 16798000000.00, 2.12, 2.10, 7925000000.00, 8013000000.00),
('MFST', 2017, 89950000000.00, 22632000000.00, 21204000000.00, 2.74, 2.71, 7746000000.00, 7832000000.00),
('MFST', 2018, 110360000000.00, 35058000000.00, 16571000000.00, 2.15, 2.13, 7700000000.00, 7794000000.00),
('MFST', 2019, 125843000000.00, 42959000000.00, 39240000000.00, 5.11, 5.06, 7673000000.00, 7753000000.00),
('MFST', 2020, 143015000000.00, 52959000000.00, 44281000000.00, 5.82, 5.76, 7610000000.00, 7683000000.00),
('MFST', 2021, 168088000000.00, 69916000000.00, 61271000000.00, 8.12, 8.05, 7547000000.00, 7608000000.00),
('MFST', 2022, 198270000000.00, 83383000000.00, 72738000000.00, 9.7, 9.65, 7496000000.00, 7540000000.00),
('MFST', 2023, 211915000000.00, 88523000000.00, 72361000000.00, 9.72, 9.68, 7446000000.00, 7472000000.00),
('MFST', 2024, 218310000000.00, 93900000000.00, 77096000000.00, 10.37, 10.32, 7439000000.00, 7466250000.00);

INSERT INTO Income (Ticker, Year, Revenue, Operating_Income, Net_Income, Basic_EPS, Diluted_EPS, Basic_WASO, Diluted_WASO)
VALUES 
('CSCO', 2014, 47142000000.00, 9763000000.00, 7853000000.00, 2.00, 1.00, 5234000000.00, 5281000000.00),
('CSCO', 2015, 49161000000.00, 11254000000.00, 8981000000.00, 2.00, 2.00, 5104000000.00, 5146000000.00),
('CSCO', 2016, 49247000000.00, 12928000000.00, 10739000000.00, 2.00, 2.00, 5053000000.00, 5088000000.00),
('CSCO', 2017, 48005000000.00, 12729000000.00, 9609000000.00, 2.00, 2.00, 5010000000.00, 5049000000.00),
('CSCO', 2018, 49330000000.00, 12667000000.00, 110000000.00, 0.00, 0.00, 4837000000.00, 4881000000.00),
('CSCO', 2019, 51904000000.00, 14541000000.00, 11621000000.00, 3.00, 3.00, 4419000000.00, 4453000000.00),
('CSCO', 2020, 49301000000.00, 14101000000.00, 11214000000.00, 3.00, 3.00, 4236000000.00, 4254000000.00),
('CSCO', 2021, 49818000000.00, 13719000000.00, 10591000000.00, 3.00, 3.00, 4222000000.00, 4236000000.00),
('CSCO', 2022, 51557000000.00, 13975000000.00, 11812000000.00, 3.00, 3.00, 4170000000.00, 4192000000.00),
('CSCO', 2023, 56998000000.00, 15562000000.00, 12613000000.00, 3.00, 3.00, 4093000000.00, 4105000000.00),
('CSCO', 2024, 56998000000.00, 15562000000.00, 12613000000.00, 3.00, 3.00, 4093000000.00, 4105000000.00);


Drop table if exists Stock;
Create Table Stock (
Ticker VARCHAR(4),
Date DATE,
Close DECIMAL(6,2),
Volume INT,
Open DECIMAL(6,2), 
High DECIMAL(6,2),
Low DECIMAL(6,2)
);

select * from tsla_historicaldata;

Update tsla_historicaldata
Set close = REPLACE(close, '$', '');
Update tsla_historicaldata
Set close = REPLACE(close, ',', '');
Update tsla_historicaldata
Set open = REPLACE(open, '$', '');
Update tsla_historicaldata
Set open = REPLACE(open, ',', '');
Update tsla_historicaldata
Set low = REPLACE(low, '$', '');
Update tsla_historicaldata
Set low = REPLACE(low, ',', '');
Update tsla_historicaldata
Set high = REPLACE(high, '$', '');
Update tsla_historicaldata
Set high = REPLACE(high, ',', '');

UPDATE tsla_historicaldata
SET date = CONCAT(
					'20', SUBSTRING(date,length(date)-1), '-',
                    SUBSTRING(date,1,length(date)-3)
);
UPDATE tsla_historicaldata
SET date= REPLACE(date, '/','-');

insert into Stock
select 'TSLA', Date, Close, Volume, Open, High, Low from tsla_historicaldata;

UPDATE amzn_historicaldata
SET close = REPLACE(close, '$', '');
UPDATE amzn_historicaldata
SET close = REPLACE(close, ',', '');
UPDATE amzn_historicaldata
SET open = REPLACE(open, '$', '');
UPDATE amzn_historicaldata
SET open = REPLACE(open, ',', '');
UPDATE amzn_historicaldata
SET low = REPLACE(low, '$', '');
UPDATE amzn_historicaldata
SET low = REPLACE(low, ',', '');
UPDATE amzn_historicaldata
SET high = REPLACE(high, '$', '');
UPDATE amzn_historicaldata
SET high = REPLACE(high, ',', '');

UPDATE amzn_historicaldata
SET date = CONCAT(
                '20', SUBSTRING(date, LENGTH(date)-1), '-',
                SUBSTRING(date, 1, LENGTH(date)-3)
           );
UPDATE amzn_historicaldata
SET date = REPLACE(date, '/', '-');

insert into Stock
select 'AMZN', Date, Close, Volume, Open, High, Low from amzn_historicaldata;

UPDATE mfst_historicaldata
SET close = REPLACE(close, '$', '');
UPDATE mfst_historicaldata
SET close = REPLACE(close, ',', '');
UPDATE mfst_historicaldata
SET open = REPLACE(open, '$', '');
UPDATE mfst_historicaldata
SET open = REPLACE(open, ',', '');
UPDATE mfst_historicaldata
SET low = REPLACE(low, '$', '');
UPDATE mfst_historicaldata
SET low = REPLACE(low, ',', '');
UPDATE mfst_historicaldata
SET high = REPLACE(high, '$', '');
UPDATE mfst_historicaldata
SET high = REPLACE(high, ',', '');

UPDATE mfst_historicaldata
SET date = CONCAT(
                '20', SUBSTRING(date, LENGTH(date)-1), '-',
                SUBSTRING(date, 1, LENGTH(date)-3)
           );
UPDATE mfst_historicaldata
SET date = REPLACE(date, '/', '-');

insert into Stock
select 'MFST', Date, Close, Volume, Open, High, Low from mfst_historicaldata;

UPDATE sbux_historicaldata
SET close = REPLACE(close, '$', '');
UPDATE sbux_historicaldata
SET close = REPLACE(close, ',', '');
UPDATE sbux_historicaldata
SET open = REPLACE(open, '$', '');
UPDATE sbux_historicaldata
SET open = REPLACE(open, ',', '');
UPDATE sbux_historicaldata
SET low = REPLACE(low, '$', '');
UPDATE sbux_historicaldata
SET low = REPLACE(low, ',', '');
UPDATE sbux_historicaldata
SET high = REPLACE(high, '$', '');
UPDATE sbux_historicaldata
SET high = REPLACE(high, ',', '');

UPDATE sbux_historicaldata
SET date = CONCAT(
                '20', SUBSTRING(date, LENGTH(date)-1), '-',
                SUBSTRING(date, 1, LENGTH(date)-3)
           );
UPDATE sbux_historicaldata
SET date = REPLACE(date, '/', '-');

insert into Stock
select 'SBUX', Date, Close, Volume, Open, High, Low from sbux_historicaldata;

UPDATE qcom_historicaldata
SET close = REPLACE(close, '$', '');
UPDATE qcom_historicaldata
SET close = REPLACE(close, ',', '');
UPDATE qcom_historicaldata
SET open = REPLACE(open, '$', '');
UPDATE qcom_historicaldata
SET open = REPLACE(open, ',', '');
UPDATE qcom_historicaldata
SET low = REPLACE(low, '$', '');
UPDATE qcom_historicaldata
SET low = REPLACE(low, ',', '');
UPDATE qcom_historicaldata
SET high = REPLACE(high, '$', '');
UPDATE qcom_historicaldata
SET high = REPLACE(high, ',', '');

UPDATE qcom_historicaldata
SET date = CONCAT(
                '20', SUBSTRING(date, LENGTH(date)-1), '-',
                SUBSTRING(date, 1, LENGTH(date)-3)
           );
UPDATE qcom_historicaldata
SET date = REPLACE(date, '/', '-');

insert into Stock
select 'QCOM', Date, Close, Volume, Open, High, Low from qcom_historicaldata;

UPDATE nflx_historicaldata
SET close = REPLACE(close, '$', '');
UPDATE nflx_historicaldata
SET close = REPLACE(close, ',', '');
UPDATE nflx_historicaldata
SET open = REPLACE(open, '$', '');
UPDATE nflx_historicaldata
SET open = REPLACE(open, ',', '');
UPDATE nflx_historicaldata
SET low = REPLACE(low, '$', '');
UPDATE nflx_historicaldata
SET low = REPLACE(low, ',', '');
UPDATE nflx_historicaldata
SET high = REPLACE(high, '$', '');
UPDATE nflx_historicaldata
SET high = REPLACE(high, ',', '');

UPDATE nflx_historicaldata
SET date = CONCAT(
                '20', SUBSTRING(date, LENGTH(date)-1), '-',
                SUBSTRING(date, 1, LENGTH(date)-3)
           );
UPDATE nflx_historicaldata
SET date = REPLACE(date, '/', '-');

insert into Stock
select 'NFLX', Date, Close, Volume, Open, High, Low from nflx_historicaldata;

UPDATE meta_historicaldata
SET close = REPLACE(close, '$', '');
UPDATE meta_historicaldata
SET close = REPLACE(close, ',', '');
UPDATE meta_historicaldata
SET open = REPLACE(open, '$', '');
UPDATE meta_historicaldata
SET open = REPLACE(open, ',', '');
UPDATE meta_historicaldata
SET low = REPLACE(low, '$', '');
UPDATE meta_historicaldata
SET low = REPLACE(low, ',', '');
UPDATE meta_historicaldata
SET high = REPLACE(high, '$', '');
UPDATE meta_historicaldata
SET high = REPLACE(high, ',', '');

UPDATE meta_historicaldata
SET date = CONCAT(
                '20', SUBSTRING(date, LENGTH(date)-1), '-',
                SUBSTRING(date, 1, LENGTH(date)-3)
           );
UPDATE meta_historicaldata
SET date = REPLACE(date, '/', '-');

insert into Stock
select 'META', Date, Close, Volume, Open, High, Low from meta_historicaldata;

UPDATE csco_historicaldata
SET close = REPLACE(close, '$', '');
UPDATE csco_historicaldata
SET close = REPLACE(close, ',', '');
UPDATE csco_historicaldata
SET open = REPLACE(open, '$', '');
UPDATE csco_historicaldata
SET open = REPLACE(open, ',', '');
UPDATE csco_historicaldata
SET low = REPLACE(low, '$', '');
UPDATE csco_historicaldata
SET low = REPLACE(low, ',', '');
UPDATE csco_historicaldata
SET high = REPLACE(high, '$', '');
UPDATE csco_historicaldata
SET high = REPLACE(high, ',', '');

UPDATE csco_historicaldata
SET date = CONCAT(
                '20', SUBSTRING(date, LENGTH(date)-1), '-',
                SUBSTRING(date, 1, LENGTH(date)-3)
           );
UPDATE csco_historicaldata
SET date = REPLACE(date, '/', '-');

insert into Stock
select 'CSCO', Date, Close, Volume, Open, High, Low from CSCO_historicaldata;

UPDATE appl_historicaldata
SET close = REPLACE(close, '$', '');
UPDATE appl_historicaldata
SET close = REPLACE(close, ',', '');
UPDATE appl_historicaldata
SET open = REPLACE(open, '$', '');
UPDATE appl_historicaldata
SET open = REPLACE(open, ',', '');
UPDATE appl_historicaldata
SET low = REPLACE(low, '$', '');
UPDATE appl_historicaldata
SET low = REPLACE(low, ',', '');
UPDATE appl_historicaldata
SET high = REPLACE(high, '$', '');
UPDATE appl_historicaldata
SET high = REPLACE(high, ',', '');

UPDATE appl_historicaldata
SET date = CONCAT(
                '20', SUBSTRING(date, LENGTH(date)-1), '-',
                SUBSTRING(date, 1, LENGTH(date)-3)
           );
UPDATE appl_historicaldata
SET date = REPLACE(date, '/', '-');

insert into Stock
select 'APPL', Date, Close, Volume, Open, High, Low from APPL_historicaldata;

-- Question 2
select distinct sector, industry, company
from company
ORDER BY Sector, Industry ASC;

-- Question 3
SELECT s.Ticker, c.Company, s.Date, FORMAT(s.Volume, 0) AS FormattedVolume, s.Open, s.Close
FROM Stock s
JOIN Company c ON s.Ticker = c.Ticker
WHERE c.Company = 'Amazon.com Inc' AND
      YEAR(s.Date) = 2023 AND
      MONTH(s.Date) IN (10, 11)
ORDER BY s.Date DESC;

-- Question 4
SELECT
    c.Ticker,
    c.Company,
    FORMAT(MIN(i.Net_Income) / 1000000, 0) AS "Minimum Net Income in Millions",
    FORMAT(MAX(i.Net_Income) / 1000000, 0) AS "Maximum Net Income in Millions"
FROM
    Company c
JOIN
    Income i ON c.Ticker = i.Ticker
GROUP BY
    c.Ticker, c.Company
ORDER BY
    c.Company ASC;

-- Question 5
SELECT
    s.Ticker,
    c.Company,
    s.Date,
    c.Morningstar_Size AS Size,
    c.Morningstar_Style AS Style,
    CONCAT('$', FORMAT(s.Close, 2)) AS "Closing Price",
    FORMAT(i.Basic_WASO / 1000000, 0) AS "Basic WASO in Millions",
    FORMAT(i.Diluted_WASO / 1000000, 0) AS "Diluted WASO in Millions",
    CONCAT('$', FORMAT(s.Close * i.Basic_WASO / 1000000, 2)) AS "Market Cap in Millions",
    CONCAT('$', FORMAT(s.Close * i.Diluted_WASO / 1000000, 2)) AS "Diluted Market Cap in Millions"
FROM
    Stock s
JOIN
    Company c ON s.Ticker = c.Ticker
JOIN
    Income i ON s.Ticker = i.Ticker AND YEAR(s.Date) = i.Year
WHERE
    MONTH(s.Date) IN (10, 11)
ORDER BY
    c.Company ASC, s.Date DESC;


-- Question 6
WITH RankedData AS (
    SELECT
        s.Ticker,
        c.Company,
        s.Date,
        s.Close,
        ROW_NUMBER() OVER (ORDER BY s.Close DESC) AS DescendingRowNumber,
        ROW_NUMBER() OVER (ORDER BY s.Close ASC) AS AscendingRowNumber
    FROM
        Stock s
    JOIN
        Company c ON s.Ticker = c.Ticker
    WHERE
        YEAR(s.Date) = 2023
)

SELECT
    Ticker,
    Company,
    Date,
    CONCAT('$', FORMAT(Close, 2)) AS "Closing Price"
FROM
    RankedData
WHERE
    DescendingRowNumber = 1 OR AscendingRowNumber = 1
ORDER BY
    Close DESC;

    
-- Question 7
SELECT
    s1.Ticker,
    c.Company AS Name,
    s1.Date AS First_Date,
    DATE_ADD(s1.Date, INTERVAL 1 DAY) AS Last_Date,
    s1.Open AS Opening_Price,
    s2.Close AS Closing_Price,
    CONCAT('-', ROUND(((s2.Close - s1.Open) / s1.Open) * 100)) AS Percentage_Decline
FROM
    Stock s1
JOIN
    Stock s2 ON s1.Ticker = s2.Ticker AND s2.Date = DATE_ADD(s1.Date, INTERVAL 1 DAY)
JOIN
    Company c ON s1.Ticker = c.Ticker
WHERE
    s2.Close <= 0.88 * s1.Open -- 12% decline or more
ORDER BY
    s1.Ticker, s1.Date;

-- Question 8
SELECT DISTINCT
    c.Company AS Name
FROM
    Company c
WHERE NOT EXISTS (
    SELECT 1
    FROM
        Stock s1
    JOIN
        Stock s2 ON s1.Ticker = s2.Ticker AND s2.Date = DATE_ADD(s1.Date, INTERVAL 1 DAY)
    WHERE
        s1.Ticker = c.Ticker
        AND s2.Close <= 0.88 * s1.Open -- 12% decline or more
);


-- Question 9
SELECT
    Morningstar_Size,
    Morningstar_Style,
    Ticker,
    Company,
    Fiscal_Year_End,
    Year,
    CONCAT('$', FORMAT(Net_Income / 1000000, 0)) AS "Net Income in Millions",
    CASE
        WHEN RankOrder = 1 THEN 'Highest Net Income'
        WHEN RankOrder = TotalRows THEN 'Lowest Net Income'
    END AS Comment
FROM (
    SELECT
        c.Morningstar_Size,
        c.Morningstar_Style,
        i.Ticker,
        c.Company,
        c.Fiscal_Year_End,
        i.Year,
        i.Net_Income,
        RANK() OVER (PARTITION BY c.Morningstar_Size, c.Morningstar_Style ORDER BY i.Net_Income DESC) AS RankOrder,
        COUNT(*) OVER (PARTITION BY c.Morningstar_Size, c.Morningstar_Style) AS TotalRows
    FROM
        Company c
    LEFT JOIN
        Income i ON c.Ticker = i.Ticker AND i.Year = 2022
) AS RankedData
Having Comment is NOT NULL
ORDER BY
    Morningstar_Size, Morningstar_Style, Net_Income DESC;
