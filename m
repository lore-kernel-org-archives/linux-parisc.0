Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Pb with dump driver. 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Fri, 15 Feb 2002 13:55:49 +0100." <3C6D0555.BCDB04B6@admin.france.hp.com>
References: <3C6AA3C3.D21C4164@admin.france.hp.com> <20020215064352.86A404858@dsl2.external.hp.com>  <3C6D0555.BCDB04B6@admin.france.hp.com> 
Date: Fri, 15 Feb 2002 12:08:18 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020215190818.BB0464873@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> So I take the decision to modify now the code and create my own
> dump_iodc_write, dump_iodc_read, dump_iodc_wait, dump_iodc_open,
> dump_iodc_seek (I don't think I need other functions).

You should be able to leverage most of the code from palo.
Note that palo runs in th CPU in real-mode - not virtual mode.
You might consider doing the same for the dump code and just
be *very* careful about which functions you call.

Oh, and the dump path might want to do two other things:
1) PDC_IO_RESET_CLEAR
2) switch linux console back to PDC console

I don't know if some of those things are already happening.
If I have time, I'll look later.

palo is in CVS on the same server (cvs.parisc-linux.org) as our kernel.
(ie "cvs co palo" instead of linux)

> Thanks a lot to grant that point to the right direction,
> now let's go at work :-)

hehe..very welcome...I'm very happy to see you doing it...it's been
on my wish list for a long time.

thanks,
grant
