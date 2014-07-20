From: John David Anglin <dave.anglin@bell.net>
Subject: struct sigaction sa_restorer field
Date: Sun, 20 Jul 2014 19:32:22 -0400
Message-ID: <BLU436-SMTP205700FFA476092032AE8BA97F30@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The sa_restorer field is obsolete and not in the hppa struct  
sigaction, but we still
define SA_RESTORER.  What should be done?

Dave
--
John David Anglin	dave.anglin@bell.net



