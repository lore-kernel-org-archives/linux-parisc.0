Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA25655
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Jan 2001 10:01:26 -0700
Received: from upchuck.cygnus.com (taarna.cygnus.com [205.180.230.102])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id JAA07695
	for <parisc-linux@thepuffingroup.com>; Thu, 4 Jan 2001 09:04:46 -0800 (PST)
To: Paul Bame <bame@fc.hp.com>
cc: Alan Modra <alan@linuxcare.com.au>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
Reply-To: law@redhat.com
In-reply-to: Your message of Thu, 04 Jan 2001 09:36:33 MST.
             <E14EDNR-00024o-00@noam.fc.hp.com>
From: Jeffrey A Law <law@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 04 Jan 2001 10:06:49 -0700
Message-ID: <11550.978628009@upchuck>
Sender: law@cygnus.com
List-ID: <linux-parisc.vger.kernel.org>


  In message <E14EDNR-00024o-00@noam.fc.hp.com>you write:
  > 
  > For hppa64-linux it appears the only millicode we're using is $$div*
  > and $$rem*, not $$dyncall nor $sh_func_adrs.  Let me know if I should
  > be porting anything other thatn div/rem -- thanks.
That sounds correct to me.  The PA64 calling conventions don't need
$$dyncall or $sh_func_addrs.

jeff
