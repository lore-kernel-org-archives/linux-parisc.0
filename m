Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33BF448D7
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Aug 2003 11:26:22 -0600 (MDT)
Date: Mon, 25 Aug 2003 19:26:17 +0200
Message-ID: <3F2E2C770000510F@ocpmta2.freegates.net>
In-Reply-To: <20030823192834.GC5072@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
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

Well sorry for delay but here are some results with reaim:

** without itlb patch:
palx4000:# ./reaim -s25 -i25 -e300 -t -f workfile.new_dbase  

REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
25      169.01   53.58   110.99  914.15     36.57      4.14     2.51    
97   
50      325.85   100.05  218.86  948.29     18.97      8.06     2.54    
97   
75      490.89   155.85  326.41  944.20     12.59      15.25    3.21    
96   
100     651.37   207.02  434.83  948.77     9.49       21.20    3.37    
96   
125     812.15   259.13  542.80  951.18     7.61       24.58    3.13    
96   
150     971.88   308.85  651.77  953.82     6.36       31.30    3.33    
96   
175     1136.93  367.07  758.72  951.25     5.44       34.87    3.16    
96   
200     1295.63  416.43  867.37  953.98     4.77       41.33    3.30    
96   
225     1456.38  464.97  977.89  954.76     4.24       48.11    3.42    
96   
250     1626.22  526.17  1086.14 950.06     3.80       52.59    3.34    
96   
275     1771.56  563.64  1192.66 959.32     3.49       52.07    3.04    
96   
300     1943.16  626.54  1301.12 954.12     3.18       58.82    3.13    
96   
Max Jobs per Minute 959.32

** With itlb patch

palx4000:/usr/src/work/Bench/osdl-aim-7/src# ./reaim -s25 -i25 -e300 -t -f
workfile.new_dbase -r2                     

REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
25      169.10   54.33   110.57  913.66     36.55      4.87     2.96    
97   
50      333.73   107.53  218.98  925.90     18.52      10.96    3.40    
96   
75      496.19   160.85  326.81  934.12     12.45      14.36    2.98    
97   
100     647.24   202.66  435.30  954.82     9.55       18.62    2.97    
97   
125     811.55   258.77  543.35  951.88     7.62       27.05    3.45    
96   
150     974.62   312.28  650.87  951.14     6.34       30.33    3.21    
96   
175     1136.86  364.74  760.01  951.30     5.44       36.03    3.27    
96   
200     1305.43  426.45  865.77  946.81     4.73       41.49    3.28    
96   
225     1465.96  475.20  977.01  948.53     4.22       45.79    3.23    
96   
250     1625.77  526.57  1083.94 950.32     3.80       53.29    3.39    
96   
275     1785.44  578.00  1191.64 951.87     3.46       57.40    3.32    
96   
300     1952.36  635.80  1299.95 949.62     3.17       57.21    3.02    
96   
Max Jobs per Minute 954.82
REAIM Workload
Times are in seconds - Child times from tms.cstime and tms.cutime

Num     Parent   Child   Child  Jobs per   Jobs/min/  Std_dev  Std_dev  JTI
Forked  Time     SysTime UTime   Minute     Child      Time     Percent 
25      169.98   54.46   111.16  908.93     36.36      6.15     3.73    
96   
50      331.44   104.88  219.30  932.30     18.65      10.53    3.29    
96   
75      493.99   156.05  328.53  938.28     12.51      13.40    2.79    
97   
100     653.11   209.79  434.23  946.24     9.46       21.99    3.48    
96   
125     814.31   262.08  542.37  948.66     7.59       27.24    3.46    
96   
150     981.09   317.95  651.39  944.87     6.30       29.74    3.13    
96   
175     1137.42  364.84  760.67  950.84     5.43       36.31    3.30    
96   
200     1295.86  415.52  866.98  953.81     4.77       39.21    3.12    
96   
225     1463.61  472.96  977.13  950.05     4.22       44.79    3.16    
96   
250     1617.00  517.55  1084.14 955.47     3.82       49.42    3.15    
96   
275     1791.29  581.68  1193.78 948.76     3.45       57.33    3.31    
96   
300     1942.85  624.79  1302.10 954.27     3.18       59.52    3.16    
96   
Max Jobs per Minute 955.47

Now that I find what seems reasonable parameters (?) I would try to reboot
the system tomorrow morning and relaunch test with itlb patch (just to confirm
results).

hth,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 
