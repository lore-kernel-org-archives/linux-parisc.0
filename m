Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D15E0482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Aug 2003 08:52:14 -0600 (MDT)
Date: Wed, 13 Aug 2003 16:52:07 +0200
Message-ID: <3F28D76600003759@ocpmta4.freegates.net>
In-Reply-To: <20030812160612.GF20514@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] itlb miss handler optimizations!
To: "Grant Grundler" <grundler@parisc-linux.org>,
	"Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, "LaMont Jones" <lamont@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>
>osdl-aim-7 benchmark probably stresses both itlb and dtlb.
>(available from osdl.org - URL is in linux-ia64 archive)

Well I finaly find it on sf.net (via osdl.org)

And submit some bench which seems to be more in relation with vm (?):

./reaim -x -t -f worfile.shared -r3

# with new itlb stuff I got following results

REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       32.72    6.17    4.42    177.87     177.87     0.00     0.00    
100  
2       33.16    10.19   9.13    351.03     175.51     0.30     0.90    
99   
3       37.01    14.71   13.94   471.76     157.25     0.04     0.12    
99   
4       43.87    19.44   18.61   530.66     132.66     1.46     3.43    
96   
5       49.55    24.26   23.08   587.29     117.46     1.79     3.76    
96   
6       57.60    28.08   27.99   606.25     101.04     1.33     2.36    
97   
7       67.86    33.32   32.46   600.35     85.76      1.82     2.73    
97   
8       77.51    37.77   37.58   600.70     75.09      1.01     1.32    
98   
9       86.11    41.69   42.05   608.29     67.59      1.21     1.42    
98   
10      96.33    47.01   46.67   604.17     60.42      1.59     1.67    
98   
Max sustained jobs reached
Max Jobs per Minute 608.29
REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       32.58    6.11    4.32    178.64     178.64     0.00     0.00    
100  
2       31.60    10.16   9.02    368.35     184.18     0.55     1.79    
98   
3       35.51    14.90   13.48   491.69     163.90     1.40     4.09    
95   
4       40.54    19.56   18.50   574.25     143.56     1.51     3.90    
96   
5       49.35    24.16   23.72   589.67     117.93     1.07     2.20    
97   
6       58.16    28.60   27.88   600.41     100.07     1.64     2.91    
97   
7       67.67    33.38   32.62   602.04     86.01      0.48     0.71    
99   
8       78.01    37.71   37.75   596.85     74.61      1.06     1.38    
98   
9       87.46    43.28   41.86   598.90     66.54      1.30     1.51    
98   
Max sustained jobs reached
Max Jobs per Minute 602.04
REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       32.27    5.60    4.56    180.35     180.35     0.00     0.00    
100  
2       33.02    10.50   9.03    352.51     176.26     0.55     1.68    
98   
3       33.39    15.14   13.68   522.91     174.30     0.54     1.66    
98   
4       39.93    19.55   18.46   583.02     145.76     0.66     1.69    
98   
5       50.01    24.32   23.12   581.88     116.38     1.67     3.46    
96   
6       58.70    28.73   28.27   594.89     99.15      0.42     0.72    
99   
7       66.99    32.31   32.78   608.15     86.88      1.50     2.28    
97   
8       76.04    37.00   37.12   612.31     76.54      0.74     0.99    
99   
9       86.42    42.29   41.68   606.11     67.35      0.93     1.09    
98   
10      96.15    45.99   46.82   605.30     60.53      1.43     1.51    
98   
Max sustained jobs reached
Max Jobs per Minute 612.31

# with the original itlb

REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       32.37    5.79    4.42    179.80     179.80     0.00     0.00    
100  
2       33.28    10.07   9.33    349.76     174.88     0.06     0.20    
99   
3       36.37    15.30   13.73   480.07     160.02     0.21     0.58    
99   
4       41.49    19.60   18.37   561.10     140.27     2.15     5.38    
94   
5       49.21    24.03   23.40   591.34     118.27     1.26     2.62    
97   
6       59.48    29.56   27.85   587.09     97.85      2.44     4.26    
95   
7       68.38    32.96   32.47   595.79     85.11      0.96     1.43    
98   
8       76.53    36.48   37.74   608.39     76.05      2.08     2.80    
97   
9       86.39    41.80   41.91   606.32     67.37      0.86     1.01    
98   
10      95.58    45.96   46.90   608.91     60.89      1.24     1.31    
98   
11      104.80   50.56   51.60   610.88     55.53      1.21     1.17    
98   
Max sustained jobs reached
Max Jobs per Minute 610.88
REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       32.05    5.66    4.47    181.59     181.59     0.00     0.00    
100  
2       33.90    10.52   9.13    343.36     171.68     0.45     1.35    
98   
3       38.53    14.55   13.84   453.15     151.05     0.44     1.16    
98   
4       40.38    18.64   18.49   576.52     144.13     0.54     1.35    
98   
5       48.82    23.39   23.26   596.07     119.21     1.71     3.62    
96   
6       58.57    28.88   28.01   596.21     99.37      0.63     1.08    
98   
7       67.80    32.98   32.77   600.88     85.84      2.61     3.98    
96   
8       76.49    36.85   37.50   608.71     76.09      1.14     1.51    
98   
9       87.04    42.31   42.12   601.79     66.87      2.82     3.31    
96   
Max sustained jobs reached
Max Jobs per Minute 608.71
REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       32.54    5.63    4.59    178.86     178.86     0.00     0.00    
100  
2       33.68    10.74   9.00    345.61     172.80     0.32     0.97    
99   
3       35.66    14.41   13.98   489.62     163.21     1.46     4.26    
95   
4       42.70    19.24   18.43   545.20     136.30     2.18     5.35    
94   
5       49.30    23.86   23.33   590.26     118.05     1.31     2.78    
97   
6       57.14    27.50   28.11   611.13     101.86     1.56     2.81    
97   
7       66.99    31.90   33.07   608.15     86.88      0.70     1.06    
98   
8       77.60    37.64   37.46   600.00     75.00      0.99     1.31    
98   
9       85.76    41.25   42.08   610.77     67.86      1.50     1.78    
98   
10      97.18    47.80   46.20   598.89     59.89      1.48     1.56    
98   
 Job rate dropping avg: 605.79 loss pct: 1.14
Max Jobs per Minute 611.13

AND

./reaim -q -t -f worfile.shared -r3

# with new itlb stuff I got following results

REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       32.83    6.03    4.51    177.28     177.28     0.00     0.00    
100  
2       33.20    10.88   8.84    350.60     175.30     0.67     2.06    
97   
3       35.94    15.23   13.87   485.81     161.94     1.20     3.47    
96   
4       43.43    19.65   18.23   536.03     134.01     1.01     2.37    
97   
5       49.43    24.33   23.21   588.71     117.74     0.62     1.27    
98   
6       58.17    28.72   27.79   600.31     100.05     1.12     1.96    
98   
7       66.74    32.72   32.14   610.43     87.20      1.95     2.98    
97   
8       77.11    37.67   37.27   603.81     75.48      1.41     1.86    
98   
9       86.75    42.45   41.75   603.80     67.09      0.95     1.11    
98   
10      95.95    46.78   46.57   606.57     60.66      1.09     1.16    
98   
11      105.20   50.86   51.51   608.56     55.32      1.72     1.66    
98   
Crossover achieved
Max Jobs per Minute 610.43
REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       32.73    6.28    4.47    177.82     177.82     0.00     0.00    
100  
2       33.55    10.97   8.96    346.94     173.47     0.24     0.74    
99   
3       34.55    15.24   13.70   505.35     168.45     1.20     3.58    
96   
4       40.15    19.14   18.33   579.83     144.96     0.88     2.22    
97   
5       49.94    24.48   23.26   582.70     116.54     1.00     2.05    
97   
6       60.80    28.86   27.50   574.34     95.72      0.81     1.35    
98   
7       67.28    33.01   32.08   605.53     86.50      1.47     2.24    
97   
8       77.15    37.59   37.02   603.50     75.44      1.37     1.80    
98   
9       85.40    40.94   42.18   613.35     68.15      1.75     2.09    
97   
10      95.15    45.89   46.72   611.67     61.17      1.11     1.19    
98   
11      104.86   50.49   51.54   610.53     55.50      1.49     1.44    
98   
Crossover achieved
Max Jobs per Minute 613.35
REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       33.13    6.50    4.44    175.67     175.67     0.00     0.00    
100  
2       32.23    10.82   8.89    361.15     180.58     0.23     0.72    
99   
3       35.72    15.39   13.76   488.80     162.93     2.12     6.37    
93   
4       42.04    20.43   18.52   553.76     138.44     3.55     8.94    
91   
5       49.50    24.03   23.06   587.88     117.58     2.50     5.26    
94   
6       57.70    27.79   28.01   605.20     100.87     1.45     2.60    
97   
7       67.37    32.72   32.59   604.72     86.39      0.68     1.03    
98   
8       76.52    36.82   37.57   608.47     76.06      0.90     1.19    
98   
9       86.14    42.06   41.87   608.08     67.56      0.87     1.03    
98   
10      96.24    47.16   46.63   604.74     60.47      1.62     1.72    
98   
11      105.27   51.04   51.32   608.15     55.29      1.29     1.23    
98   
Crossover achieved
Max Jobs per Minute 608.47

# with the original itlb


REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       32.35    5.94    4.50    179.91     179.91     0.00     0.00    
100  
2       31.31    10.80   9.27    371.77     185.88     0.40     1.29    
98   
3       34.63    15.23   13.94   504.19     168.06     0.25     0.74    
99   
4       40.22    18.84   18.58   578.82     144.70     1.07     2.74    
97   
5       48.83    23.89   23.31   595.95     119.19     0.84     1.76    
98   
6       58.67    28.74   28.11   595.19     99.20      1.96     3.46    
96   
7       68.28    32.71   33.19   596.66     85.24      1.02     1.52    
98   
8       77.41    37.61   37.58   601.47     75.18      0.76     1.00    
99   
9       86.21    41.55   42.28   607.59     67.51      1.44     1.71    
98   
10      95.30    45.91   46.78   610.70     61.07      1.46     1.56    
98   
11      106.35   51.52   51.38   601.97     54.72      0.82     0.78    
99   
Crossover achieved
Max Jobs per Minute 610.70
REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       32.33    5.88    4.46    180.02     180.02     0.00     0.00    
100  
2       31.53    10.07   9.19    369.17     184.59     0.38     1.20    
98   
3       35.76    14.74   14.01   488.26     162.75     1.13     3.23    
96   
4       41.04    19.34   18.52   567.25     141.81     1.47     3.70    
96   
5       49.68    24.37   23.11   585.75     117.15     1.32     2.72    
97   
6       58.14    27.69   28.40   600.62     100.10     0.64     1.12    
98   
7       68.26    33.09   33.00   596.84     85.26      0.87     1.30    
98   
8       77.46    37.61   37.39   601.08     75.14      0.85     1.11    
98   
9       86.90    42.44   42.03   602.76     66.97      1.51     1.76    
98   
10      95.84    46.22   46.81   607.26     60.73      1.11     1.18    
98   
11      106.16   51.65   51.22   603.05     54.82      1.32     1.26    
98   
Crossover achieved
Max Jobs per Minute 607.26
REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
1       32.64    5.95    4.62    178.31     178.31     0.00     0.00    
100  
2       32.83    10.56   9.20    354.55     177.28     0.27     0.83    
99   
3       36.69    15.87   13.83   475.88     158.63     0.15     0.41    
99   
4       40.89    19.04   18.71   569.33     142.33     0.21     0.51    
99   
5       49.90    23.61   23.39   583.17     116.63     0.60     1.22    
98   
6       59.07    28.39   28.51   591.16     98.53      1.77     3.09    
96   
7       67.94    32.63   32.75   599.65     85.66      1.05     1.58    
98   
8       76.17    36.23   37.74   611.26     76.41      3.08     4.15    
95   
9       86.15    41.37   42.21   608.01     67.56      0.97     1.14    
98   
10      95.27    46.00   46.57   610.90     61.09      1.29     1.37    
98   
11      105.61   51.56   51.21   606.19     55.11      0.79     0.76    
99   
Crossover achieved
Max Jobs per Minute 611.26

===========================

(Carlos, I have no really clue about bench, so if you find some other test
that will better respond to your expectations, do not hesitate ... I will
try to do my best :) )

Joel



-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 
