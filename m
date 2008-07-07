From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: in ccio_io_pdir_entry(),BUG_ON() seems to break gcc-4.2
	optimization?
Date: Mon, 7 Jul 2008 09:28:35 -0600
Message-ID: <20080707152835.GA5869@colo.lackof.org>
References: <K324MR$1963B6E59C4D4D716463AB17911CD186@scarlet.be> <20080628202347.GA23898@colo.lackof.org> <4866BA91.9040607@scarlet.be> <20080629205242.GA7629@colo.lackof.org> <486925D4.7090608@scarlet.be> <20080702042821.GB19593@colo.lackof.org> <486BC289.6050405@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <486BC289.6050405@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jul 02, 2008 at 06:01:45PM +0000, Joel Soete wrote:
>> So can you remind me (and Kyle) why this is better than what is
>> there now?
> mmm may be because gcc consider it now as only 1 'volatile' instruction:
>
> in <ccio_map_sg>
> -----------< Original code > --------------+------------< New stuff 
> >-----------------
> 200: 06 80 53 13  lci r0(sr1,r20),r19      |  200: 08 1a 02 54  copy r26,r20
> 204: d2 73 1a 74  extrw,u r19,19,12,r19    |  204: 06 a0 53 14  lci r0(sr1,r21),r20
> 208: 08 1a 02 5c  copy r26,ret0            |  208: d2 94 1a 74  extrw,u r20,19,12,r20
> 20c: d7 93 0e 14  depw r19,15,12,ret0      |  20c: d7 94 0e 14  depw r20,15,12,ret0
> 210: 0e dc 12 80  stw ret0,0(r22)             210: 0e dc 12 80  stw ret0,0(r22)
> 214: 06 c0 12 80  fdc r0(r22)                 214: 06 c0 12 80  fdc r0(r22)
> 218: 00 00 04 00  sync                        218: 00 00 04 00  sync
>
> thought?

I'm not comfortable "New stuff" version is correct.

In "New Stuff", r20 gets clobbered and values copied from
r26 are lost. That's not the case in the original code.
"depw" only replaces 12 bits of "ret0" in the original code.

thanks,
grant
