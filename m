Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] iodc call and HPMC: dump driver. 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Mon, 02 Sep 2002 08:12:26 +0200." <3D73014A.15ED96ED@admin.france.hp.com>
References: <3D73014A.15ED96ED@admin.france.hp.com> 
Date: Mon, 02 Sep 2002 22:22:57 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020903042257.D4E344829@dsl2.external.hp.com>
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
> DUMPDEV_WRITE = 1

I've found the right set of constants and argument parameters.
Those are now committed to include/asm-parisc/pdc.h.

I just realized the comments are incomplete...I only
included ARG0-ARG5 - there can be 8 args depending on
the call...hmm...I'll omit and document in the code
where it's used.

thanks,
grant
