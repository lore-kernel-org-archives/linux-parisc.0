Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Pb with dump driver. 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Fri, 15 Feb 2002 21:01:08 GMT." <20020215210108.I7053@parcelfarce.linux.theplanet.co.uk>
References: <3C6AA3C3.D21C4164@admin.france.hp.com> <20020215064352.86A404858@dsl2.external.hp.com> <3C6D0555.BCDB04B6@admin.france.hp.com> <bruno_vidal@hpfrcu03.france.hp.com> <20020215190818.BB0464873@dsl2.external.hp.com>  <20020215210108.I7053@parcelfarce.linux.theplanet.co.uk> 
Date: Sat, 16 Feb 2002 23:15:21 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020217061521.B2CF7482A@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> I personally HATE the idea of a kernel dump driver and
> think that MPE's solution (on a TOC, dump the ram after reset) was
> more elegant and easy to prove correct.
> 
> Note that grant disagrees with me on this.

I'm not religous about this. At this point, I'm happy for *any*
kind of a dump tool to debug kernel state when the system crashes.

grant
