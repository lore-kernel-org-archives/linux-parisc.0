Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA05106
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Dec 2000 16:14:10 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 247EC5C8
	for <parisc-linux@thepuffingroup.com>; Tue, 26 Dec 2000 15:17:18 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id PAA22509
	for <parisc-linux@thepuffingroup.com>; Tue, 26 Dec 2000 15:18:32 -0800 (PST)
Message-Id: <200012262318.PAA22509@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] dd and 2k transfers on A500 
In-reply-to: Your message of "Fri, 22 Dec 2000 17:10:05 PST."
             <200012230110.RAA20271@milano.cup.hp.com>
Date: Tue, 26 Dec 2000 15:18:29 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


So I'm able to reproduce the problem on c3k/32-bit.

Grant Grundler wrote:
> It seems like we start reading from the wrong 1k block
> on the disk - assuming the data is really coming from disk.
> If so, I should be able to capture this with a SCSI analyzer.
> I'll try that next week.

Captured the incoming data w/SCSI analyzer and it's correct.
We are reading the correct data from disk but doesn't match what
ends up in the "bad" versions of the destination file. 

Another data point: while every other dd bs=2k gets corrupted, it's
every fourth transfer for dd bs=2560/3k/3584.
data corruption seems to occur when size hits/crosses 4k alignment.

> I very suspicous of generic kernel since the data is placed wrong
> by a 1k offset, the same size linux uses internally.

1k could just be an artifact of the scatter/gather list handed
to SBA code and SBA code is botching the merging of entries somehow.
I don't want to say this is an SBA bug until I find it.
But it looks alot more like it now. :^(

SCSI analyser output is appended in case anyone is curious.
Note I've programmed the analyzer to only capture the first 8 DATA
and ignore the rest.  Also note there are *no* filesystem writes.
The filesystem I'm dumping the data to is on the same SCSI bus.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253


SCSI STATE  -  State Listing


Label    > DATA_   Time        Phase  SCSI mnemonic
Base     >  Hex  Relative                        Hex
__________ _____ _________ ________________________________________________

   -131     0080           Arbitrate ID=07
   -130     00A0  2.592 us Select Atn ID=05
   -129     00C0  3.520 us Msgout Atn Identify Disconnect, Logical=0
   -128     0020  1.424 us Msgout Atn Simple Queue Tag=37H
   -127     0037  1.000 us Msgout 37H
   -126     0028  3.472 us Commd  Read (10 byte)
   -125     0000    624 ns Commd  Lu=0
   -124     0000    432 ns Commd  Logical Block Addr=00000000H
   -123     0000    424 ns Commd
   -122     0000    424 ns Commd
   -121     0000    424 ns Commd
   -120     0000    424 ns Commd
   -119     0000    424 ns Commd  Transfer Length=0004H
   -118     0004    424 ns Commd
   -117     0000    424 ns Commd
   -116     0004  5.344 us Msg_in Disconnect
   -115     0000    856 ns Bus Free
   -114     0020  16.76 ms Arbitrate ID=05
   -113     00A0  1.536 us Reselect ID=07
   -112     0080  13.62 us Msg_in Identify No Disconnect Logical=0
   -111     0020    864 ns Msg_in Simple Queue Tag=37H
   -110     0037  4.976 us Msg_in 37H
   -109     3420  2.192 us Dat_in 3420H   DBP1=0 DBP=0
   -108     0518     56 ns Dat_in 0518H   DBP1=1 DBP=1
   -107     20E0     48 ns Dat_in 20E0H   DBP1=0 DBP=0
   -106     222E     48 ns Dat_in 222EH   DBP1=1 DBP=1
   -105     3420     48 ns Dat_in 3420H   DBP1=0 DBP=0
   -104     0528     56 ns Dat_in 0528H   DBP1=1 DBP=1
   -103     20E0     48 ns Dat_in 20E0H   DBP1=0 DBP=0
   -102     7220     48 ns Dat_in 7220H   DBP1=1 DBP=0
   -101     0000  67.28 us Status Good
   -100     0000  4.336 us Msg_in Command Complete
    -99     0000    856 ns Bus Free
    -98     0080  356.4 ms Arbitrate ID=07
    -97     00A0  2.616 us Select Atn ID=05
    -96     00C0  3.592 us Msgout Atn Identify Disconnect, Logical=0
    -95     0020  1.352 us Msgout Atn Simple Queue Tag=39H
    -94     0039    976 ns Msgout 39H
    -93     0028  3.472 us Commd  Read (10 byte)
    -92     0000    552 ns Commd  Lu=0
    -91     0000    424 ns Commd  Logical Block Addr=00000000H
    -90     0000    424 ns Commd
    -89     0000    424 ns Commd
    -88     0000    424 ns Commd
    -87     0000    432 ns Commd
    -86     0000    424 ns Commd  Transfer Length=0004H
    -85     0004    424 ns Commd
    -84     0000    424 ns Commd
    -83     0004  5.440 us Msg_in Disconnect
    -82     0000    856 ns Bus Free
    -81     0020  3.001 ms Arbitrate ID=05
    -80     00A0  1.488 us Reselect ID=07
    -79     0080  13.59 us Msg_in Identify No Disconnect Logical=0
    -78     0020    832 ns Msg_in Simple Queue Tag=39H
    -77     0039  4.992 us Msg_in 39H
    -76     3420  2.184 us Dat_in 3420H   DBP1=0 DBP=0
    -75     0518     48 ns Dat_in 0518H   DBP1=1 DBP=1
    -74     20E0     56 ns Dat_in 20E0H   DBP1=0 DBP=0
    -73     222E     48 ns Dat_in 222EH   DBP1=1 DBP=1
    -72     3420     48 ns Dat_in 3420H   DBP1=0 DBP=0
    -71     0528     48 ns Dat_in 0528H   DBP1=1 DBP=1
    -70     20E0     56 ns Dat_in 20E0H   DBP1=0 DBP=0
    -69     7220     48 ns Dat_in 7220H   DBP1=1 DBP=0
    -68     0000  67.21 us Status Good
    -67     0000  4.312 us Msg_in Command Complete
    -66     0000    856 ns Bus Free
    -65     0080  350.4 ms Arbitrate ID=07
    -64     00A0  2.592 us Select Atn ID=05
    -63     00C0  3.512 us Msgout Atn Identify Disconnect, Logical=0
    -62     0020  1.424 us Msgout Atn Simple Queue Tag=3BH
    -61     003B  1.000 us Msgout 3BH
    -60     0028  3.480 us Commd  Read (10 byte)
    -59     0000    624 ns Commd  Lu=0
    -58     0000    424 ns Commd  Logical Block Addr=00000000H
    -57     0000    424 ns Commd
    -56     0000    424 ns Commd
    -55     0000    424 ns Commd
    -54     0000    432 ns Commd
    -53     0000    424 ns Commd  Transfer Length=0004H
    -52     0004    424 ns Commd
    -51     0000    424 ns Commd
    -50     0004  5.336 us Msg_in Disconnect
    -49     0000    856 ns Bus Free
    -48     0020  8.956 ms Arbitrate ID=05
    -47     00A0  1.544 us Reselect ID=07
    -46     0080  13.62 us Msg_in Identify No Disconnect Logical=0
    -45     0020    880 ns Msg_in Simple Queue Tag=3BH
    -44     003B  5.064 us Msg_in 3BH
    -43     3420  2.184 us Dat_in 3420H   DBP1=0 DBP=0
    -42     0518     56 ns Dat_in 0518H   DBP1=1 DBP=1
    -41     20E0     48 ns Dat_in 20E0H   DBP1=0 DBP=0
    -40     222E     48 ns Dat_in 222EH   DBP1=1 DBP=1
    -39     3420     48 ns Dat_in 3420H   DBP1=0 DBP=0
    -38     0528     56 ns Dat_in 0528H   DBP1=1 DBP=1
    -37     20E0     48 ns Dat_in 20E0H   DBP1=0 DBP=0
    -36     7220     48 ns Dat_in 7220H   DBP1=1 DBP=0
    -35     0000  67.48 us Status Good
    -34     0000  4.312 us Msg_in Command Complete
    -33     0000    784 ns Bus Free
    -32     0080  354.2 ms Arbitrate ID=07
    -31     00A0  2.592 us Select Atn ID=05
    -30     00C0  3.536 us Msgout Atn Identify Disconnect, Logical=0
    -29     0020  1.400 us Msgout Atn Simple Queue Tag=3DH
    -28     003D  1.000 us Msgout 3DH
    -27     0028  3.472 us Commd  Read (10 byte)
    -26     0000    632 ns Commd  Lu=0
    -25     0000    424 ns Commd  Logical Block Addr=00000000H
    -24     0000    424 ns Commd
    -23     0000    424 ns Commd
    -22     0000    424 ns Commd
    -21     0000    424 ns Commd
    -20     0000    424 ns Commd  Transfer Length=0004H
    -19     0004    432 ns Commd
    -18     0000    424 ns Commd
    -17     0004  5.312 us Msg_in Disconnect
    -16     0000    776 ns Bus Free
    -15     0020  5.147 ms Arbitrate ID=05
    -14     00A0  1.496 us Reselect ID=07
    -13     0080  13.67 us Msg_in Identify No Disconnect Logical=0
    -12     0020    848 ns Msg_in Simple Queue Tag=3DH
    -11     003D  4.968 us Msg_in 3DH
    -10     3420  2.208 us Dat_in 3420H   DBP1=0 DBP=0
     -9     0518     48 ns Dat_in 0518H   DBP1=1 DBP=1
     -8     20E0     48 ns Dat_in 20E0H   DBP1=0 DBP=0
     -7     222E     48 ns Dat_in 222EH   DBP1=1 DBP=1
     -6     3420     56 ns Dat_in 3420H   DBP1=0 DBP=0
     -5     0528     48 ns Dat_in 0528H   DBP1=1 DBP=1
     -4     20E0     48 ns Dat_in 20E0H   DBP1=0 DBP=0
     -3     7220     48 ns Dat_in 7220H   DBP1=1 DBP=0
     -2     0000  67.51 us Status Good
     -1     0000  4.304 us Msg_in Command Complete
      0     0000    864 ns Bus Free

Time Printed: 26 Dec 2000 14:30:36  ---  Time Acquired: 26 Dec 2000 14:26:37
