Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power Button doesn't turn machine off anymore 
In-Reply-To: Message from Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
   of "Wed, 03 Jul 2002 14:17:38 +0200." <20020703121737.GS15228@charite.de>
References: <20020702183558.GO25586@charite.de> <B1225F09-8DEC-11D6-A95C-0030656F07A2@esiee.fr> <20020702185708.GP25586@charite.de> <20020702190606.GA3678@systemhalted> <20020702190842.GR25586@charite.de> <20020702192147.GC3678@systemhalted> <20020702193116.GU25586@charite.de> <20020703052415.GB32490@charite.de> <20020703121306.GA8464@systemhalted>  <20020703121737.GS15228@charite.de> 
Date: Wed, 03 Jul 2002 10:46:30 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020703164631.F0CE2483A@dsl2.external.hp.com>
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

Ralf Hildebrandt wrote:
> I rebooted this morning after I recompiled a kernel. I added
> CONFIG_IOMMU_CCIO=y

That's not needed for 712/715/B-class/et al.

grant
