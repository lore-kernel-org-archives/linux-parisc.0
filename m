Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A726483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Nov 2003 11:11:47 -0700 (MST)
Message-ID: <3FB51AE5.9090503@tiscali.be>
Date: Fri, 14 Nov 2003 18:11:49 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: =?ISO-8859-2?Q?Damian_Muchli=F1ski?= <mudamian@poczta.onet.pl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux on HP
References: <002901c3aad6$87fb1c10$64d71399@Damian>
In-Reply-To: <002901c3aad6$87fb1c10$64d71399@Damian>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
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

Hi Damian,

Can you give more detail on the model of your "HP computer".
I encounter a similar problem with a b2000 because of a pb between pdc 
console support and Suckio driver for the ide-cdrom.

I was too lasy to learn how to build a custom net-iso cd, so I copy a 
system disk (installed on a b180) on an external disk. Then i boot the 
b2k with this disk plug in an additional scsi controler, to finaly copy 
its contain on the internal disk (and when the disk went down, I just 
follow the same procedure :) ).

hth,
	Joel

Damian Muchliñski wrote:
> Hello
> 
> I'm trying to set-up linux on HP computer. First I've tried Debian Stable
> Woody relase with 2.4.17 kernel but i got message WARNING! Stack pointer
> and cr30 do not correspond! I've found on newsgroup that because of old
> version of gcc and kernel and I should use newer version. So I have
> downloaded palinux-2.4.22-pa13-20031022-netinst.iso from your
> website,check md5, burned and booted.
> Unfortunately it hangs on "searching for devices" without any more info.
> I would be very gratefull if you could help me solve this problem. Maybe
> somemone else had similar problem.
>  
>  I've attached files with bugreport.
> 
> 
> Thanks for any suggestions, waiting for reply from you.
> 
