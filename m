Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 30 Sep 2003 12:50:23 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] N Class SMP pb ?  (follow up)
Message-ID: <20030930185023.GB7391@dsl2.external.hp.com>
References: <3F5CB6FB0000AD75@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F5CB6FB0000AD75@ocpmta1.freegates.net>
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

On Tue, Sep 30, 2003 at 06:31:17PM +0200, Joel Soete wrote:
> Hi Grant,
> 
> Here is the very last test I did yesterday with the additional mdelay(100):
> 
> >TOC the machine, "ser pim" and look at PSW in TOC Info for each CPU.
> >bit 0 is the I-Bit IIRC.
> 
> In summary:
> -------  Processor 1 HPMC Information - PDC Version: 41.28  ------

Did you TOC the machine or did it HPMC?
I was under the impression the SW had hung and one needed to TOC
to regain control. TOC info is seperate from HPMC info.

If it's in fact HPMC, then look at IOAQ/GR02 for both CPUs
and see which functions they were executing in when HPMC occurred.

grant
