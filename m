From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] nscd: error while loading shared libraries:
	unexpected reloc type 0x42
Date: Mon, 26 Dec 2005 16:47:20 -0500 (EST)
Message-ID: <200512262147.jBQLlKKP018323@hiauly1.hia.nrc.ca>
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

I'm seeing the following error in the boot log:

Fri Nov 25 04:59:01 2005: Starting Name Service Cache Daemon: nscd/usr/sbin/nscd
: error while loading shared libraries: unexpected reloc type 0x42
Fri Nov 25 04:59:02 2005: .

I think this is a R_PARISC_PLABEL21L reloc.  GCC doesn't generate these.
So they must come from an asm or assembly code.  I think libc used this
reloc for loading the address of the function descriptor of main.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
