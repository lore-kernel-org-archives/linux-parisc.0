From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: rcu threads with 2.6.39+
Date: Tue, 24 May 2011 17:02:38 -0400
Message-ID: <20110524210238.GA26413@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I built 2.6.39+ Sunday from Linus' tree.  System seems slower than before
and the rcu kernel threads seem to run a lot:

dave@mx3210:~$ ps -ef|grep rcu
root         7     2 46 May22 ?        21:14:59 [rcuc0]
root         8     2  0 May22 ?        00:00:00 [rcun0]
root         9     2  0 May22 ?        00:00:03 [rcun1]
root        37     2 19 May22 ?        08:55:59 [rcuc1]
root        41     2 10 May22 ?        04:50:25 [rcuc2]
root        45     2 11 May22 ?        05:10:35 [rcuc3]

Any ideas?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
