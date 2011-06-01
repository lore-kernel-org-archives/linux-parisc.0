From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: rcu threads with 2.6.39+
Date: Tue, 31 May 2011 20:48:07 -0400
Message-ID: <20110601004806.GA3984@hiauly1.hia.nrc.ca>
References: <20110524210238.GA26413@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110524210238.GA26413@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 24 May 2011, John David Anglin wrote:

> I built 2.6.39+ Sunday from Linus' tree.  System seems slower than before
> and the rcu kernel threads seem to run a lot:
> 
> dave@mx3210:~$ ps -ef|grep rcu
> root         7     2 46 May22 ?        21:14:59 [rcuc0]
> root         8     2  0 May22 ?        00:00:00 [rcun0]
> root         9     2  0 May22 ?        00:00:03 [rcun1]
> root        37     2 19 May22 ?        08:55:59 [rcuc1]
> root        41     2 10 May22 ?        04:50:25 [rcuc2]
> root        45     2 11 May22 ?        05:10:35 [rcuc3]

The worst of the load problems are fixed by commit
07ef3c3b44896bc0432a901fe6ae0d0deaca47ce
Load average has now dropped by about a factor two.

However, the rcuc* threads are still major time consumers.  After
about three hours of runtime building gcc:

    7 root      -2  19     0    0    0 S    8  0.0  80:50.10 rcuc0              
   37 root      -2  19     0    0    0 S    2  0.0  37:44.47 rcuc1              
   41 root      -2  19     0    0    0 S    0  0.0  26:39.63 rcuc2              
   45 root      -2  19     0    0    0 S    0  0.0  28:12.77 rcuc3              

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
