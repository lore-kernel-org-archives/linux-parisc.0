Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AF3B482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Jun 2002 10:00:04 -0600 (MDT)
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <1023292640.3cfe34e07e65b@webmail.tiscalinet.be>
Date: Wed, 05 Jun 2002 17:57:20 +0200 (CEST)
From: joel.soete@freebel.net
Cc: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
References: <20020529110118.A3691@systemhalted> <20020529162438.GJ9919@tykepenguin.com> <20020529132631.B3691@systemhalted> <20020529180739.GL9919@tykepenguin.com> <20020530143626.GF810@tykepenguin.com> <20020530133515.B15631@systemhalted> <20020531072849.GD1145@tykepenguin.com> <20020531085419.B18658@systemhalted> <20020604115547.GB1808@tykepenguin.com> <20020604084440.A24973@systemhalted> <20020604154954.GA29187@tausq.org>
In-Reply-To: <20020604154954.GA29187@tausq.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hi all,

It seems that the b2000 I used to test gcc-3.2 does not crash anymore :) with
all kernels :)) (pl 2.4.18 or my stuff on 2.4.19)? (I feel that fs corruption
occurs and was not detected immideately?)

Well I come back to you to see what should be the useable kdb config (to
investigate the network problem with kernel compiled with gcc-3.1 or -3.2).

Mine is now:
CONFIG_MAGIC_SYSRQ=Y
CONFIG_KDB=Y
CONFIG_KDB_MODULES=Y
# CONFIG_KDB_OFF IS NOT SET
CONFIG_KALLSYMS=Y

Thanks a lot,
    Joel

Quoting Randolph Chung <randolph@tausq.org>:

> > I think there are two maybe three places where kdb initializes 
> > certain structures during startup. I'm going to have to check 
> > those paths to see how far it gets before dying.
> > 
> > Any comments from the crowd would be helpfull :)
> > 
> > /me goes off to add some printk's and extra check
> 
> i've been offline for a bit so i might have missed something... but
> aiui
> the symptom you've been seeing is that it hangs at the "If this is the
> last message you see" message? has anyone tried to compile a kernel
> with
> early bootup messages (there's a #define in pdc_cons.c to enable this)
> and see if they get farther?
> 
> there are some debugging stuff that you can turn on in
> arch/parisc/kernel/unwind.c ... that piece of code has caused some hangs
> 
> in the past, you might want to enable those printks as well.
> 
> randolph
> -- 
>    @..@                                         http://www.TauSq.org/
>   (----)
>  ( >__< )
>  ^^ ~~ ^^
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
