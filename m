Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA16815
	for <parisc-linux@puffin.external.hp.com>; Tue, 25 Jan 2000 12:42:19 -0700
Sender: mkp@socsci.auc.dk
To: Hannu Martikka <martikka@stybba.ntc.nokia.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715 problem
References: <Pine.LNX.4.10.10001241636160.3967-100000@grasshopper.thepuffingroup.com> <Pine.HPX.4.21.0001251927060.15648-200000@gamgee.ntc.nokia.com> <20000125142243.B32390@thepuffingroup.com>
From: "Martin K. Petersen" <mkp@mkp.net>
Date: 25 Jan 2000 19:43:06 +0100
In-Reply-To: willy@thepuffingroup.com's message of "Tue, 25 Jan 2000 14:22:43 -0500"
Message-ID: <yq1puuq801x.fsf@leyland.socsci.auc.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "willy" == willy  <willy@thepuffingroup.com> writes:

>> Also I wonder why it doesn't recognice the Model/CPU-type? Even the
>> size of memory is incorrent (256). 

We've run into quite a few problems on machines with plenty of memory
the last couple of weeks so we are currently using 128 MB as cutoff
value.

I just fixed it so that it will output the correct memsize no matter
which limits we enforce during development. Pure cosmetics, though...

-- 
Martin Kasper Petersen			BOFH, IC1&2, Aalborg University, DK
mailto:mkp@SunSITE.auc.dk		http://SunSITE.auc.dk/~mkp/
