From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] What happen to the Penguin
Date: Mon, 26 Jun 2006 19:59:31 -0400 (EDT)
Message-ID: <200606262359.k5QNxVrN007724@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I haven't been able to boot recent consoles of my c3k (oh, I did
accidently boot a 64-bit kernel built for an A500 without frame
buffer support).  The last build that successfully boots is
2.6.17-rc3-pa3.  The last messages that is see are:

...
STI PCI graphic ROM found at f6000000 (64 kB), fb at f8000000 (32 MB)
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
    graphics card name: PCI_GRAFFITIX1280
STI PCI graphic ROM found at f7000000 (2048 kB), fb at fa000000 (32 MB)
    id 35acda30-9a02587, conforms to spec rev. 8.0d
    graphics card name: A1262A
sticon: Initializing STI text console.

Possibly, the problem is the unsupported A1262A.  This is what
follows with 2.6.17-rc3-pa3:

Console: switching to colour STI console 160x64
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, PCI_GRAFFITIX1280, id: 2d08c0a7, mm
io: 0xf8100000
stifb: 'A1262A' (id: 0x35acda30) not supported.
...

Any ideas as to what's broken in later kernels?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
