Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 2 Jun 2003 15:58:03 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] compiler & kernel
Message-ID: <20030602215803.GC3983@dsl2.external.hp.com>
References: <3ED70CF100000B3C@ocpmta2.freegates.net> <Pine.LNX.4.44.0306022044001.1415-300000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0306022044001.1415-300000@sal.ucc.ie>
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

On Mon, Jun 02, 2003 at 09:20:06PM +0100, M. Grabert wrote:
> I didn't have problems with the UW-SCSI that was originally in the HP - as
> far as I can remember - these problems just show up with this
> 'replacement' SE-SCSI Segate Harddisk.

Was the original configuration using LVD?
(SE requires much shorter cables than LVD for the same transfer rates)

Have you looked for firmware updates for the disk?
Have you tried forcing the SCSI bus to a slower transfer rate?

> Yeah, I also think there is no problem with LVD, it's just appears to
> happens with the SE-SCSI bus and this hard disk (and the hard disk seems
> to be fine if connected to other computers).

Smells like a cable length/termination issue.

grant
