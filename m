Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep01-app.kolumbus.fi (fep01-0.kolumbus.fi [193.229.0.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id 194704829
	for <parisc-linux@parisc-linux.org>; Thu, 10 Oct 2002 10:23:51 -0600 (MDT)
Received: from azrael.blades.cxm ([62.248.235.104])
          by fep01-app.kolumbus.fi with ESMTP
          id <20021010162344.FMSL4680.fep01-app.kolumbus.fi@azrael.blades.cxm>
          for <parisc-linux@parisc-linux.org>;
          Thu, 10 Oct 2002 19:23:44 +0300
Received: (from blades@localhost)
	by azrael.blades.cxm (SGI-8.9.3/8.9.3) id TAA42352
	for parisc-linux@parisc-linux.org; Thu, 10 Oct 2002 19:23:18 +0300 (EEST)
Date: Thu, 10 Oct 2002 19:23:17 +0300
From: Harri Haataja <harri.haataja@smilehouse.com>
Cc: "'parisc-linux maillist'" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Which Memory to use on a 715/80?
Message-ID: <20021010192305.G37854@azrael.smilehouse.com>
References: <02Oct10.174726cest.119043@ns.hiscom.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <02Oct10.174726cest.119043@ns.hiscom.nl>; from c.beerse@torex-hiscom.nl on Thu, Oct 10, 2002 at 05:34:47PM +0200
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

On Thu, Oct 10, 2002 at 05:34:47PM +0200, "Beerse, Corné" wrote:
> > -----Original Message-----
> > From: Grant Grundler [mailto:grundler@dsl2.external.hp.com]
> > Derek Engelhaupt wrote:
> > > Well, don't think any other manufacturer made memory for the 715
> > > series.  I have looked at Dataram and others, but they only seem
> > > to have memory for the D,K,N,L, and A class servers.
> > I thought Kingston *did* (maybe no more).
> I recal by head (and might be wrong) to have used pc-based memory
> modules in a 712/80. There was something with parity (it needs it or
> it hates it, don't know).

You usually hear that HP uses similiar form but completely different
ram. But that's mostly on 715/735/800, maybe 712 was different. That
would be a pleasant surprise.
Mostly you always want parity. I would doubt anything explicitly
demanding no parity.

> Try what the bootloader says if you fit it with pc-based memory
> modules, that have the same physical lay-out. (edo-ram is a term that
> comes to mind, try it or it's predecessor).

EDO AFAIK never occurs together with ECC so that's the word to avoid
when looking for ram for older workstations ad servers.
36-bit FPM True-parity ECC SIMMs are what work in, for example, DEC
Alpha AXPpci, Multia, SGI Indy, Indigo², matching Challenges, IBM RS6000
7006 and other machines of the era and most(?) pc's. No kind of EDO ram
works.

> I might be totaly wrong here, in those days (a former job) I was using
> both SunSparc stations and HP 712 machines.

Sparcstations mostly use weird rams like JEDEC DIMM's apart from the
very old ones that use 36-pin simm's that seem regular.


This is what I remember. No guarantees either.

-- 
I used to herd dairy cows. Now I herd lusers. Apart from the isolation,
I think I preferred the cows. They were better conversation, easier to
milk, and if they annoyed me enough, I could shoot them and eat them.
		-- Rodger Donaldson 
