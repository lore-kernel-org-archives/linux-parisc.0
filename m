Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Aaron Macks <aaronm@cs.brandeis.edu>
Cc: PARISC-Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Graphics support on 755? 
In-Reply-To: Message from Aaron Macks <aaronm@cs.brandeis.edu>
   of "Sun, 30 Dec 2001 13:52:56 EST." <20011230135256.B28207@daedalus.cs.brandeis.edu>
References: <20011229182132.A23862@daedalus.cs.brandeis.edu> <3C2F42C5.6040004@interaccess.com>  <20011230135256.B28207@daedalus.cs.brandeis.edu> 
Date: Mon, 31 Dec 2001 10:44:42 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011231174442.1EE1C482F@dsl2.external.hp.com>
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

Aaron Macks wrote:
> it's an HP card, not in the EISA slots, but in the big slots on the
> backplane.  Is there anything like lspci, but for the HP slots?

not really.
You could look in /proc/bus/gsc:
setup.c:                if (NULL == proc_gsc_root)
setup.c:                        proc_gsc_root = proc_mkdir("bus/gsc", 0);

hmmm...here too:
pci-dma.c:    proc_gsc_root = proc_mkdir("gsc", 0);
pci-dma.c:    create_proc_info_entry("dino", 0, proc_gsc_root, pcxl_proc_info);

Someone could take lspci could and rewrite it to deal with PARISC
IODC data (HPPB, GSC, RUNWAY, etc).

grant
