Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA25188
	for <parisc-linux@puffin.external.hp.com>; Thu, 4 Jan 2001 09:33:13 -0700
To: Alan Modra <alan@linuxcare.com.au>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, law@redhat.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] where to put 64 bit libmilli? 
In-Reply-To: Your message of "Thu, 04 Jan 2001 18:03:25 +1100."
             <Pine.LNX.4.21.0101041753580.15554-100000@front.linuxcare.com.au>
References: <Pine.LNX.4.21.0101041753580.15554-100000@front.linuxcare.com.au> 
Date: Thu, 04 Jan 2001 09:36:33 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14EDNR-00024o-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


For hppa64-linux it appears the only millicode we're using is $$div*
and $$rem*, not $$dyncall nor $sh_func_adrs.  Let me know if I should
be porting anything other thatn div/rem -- thanks.

	-Paul Bame
