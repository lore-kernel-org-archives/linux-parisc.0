From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: nscd: error while loading shared libraries:
	unexpected reloc type 0x42
Date: Mon, 26 Dec 2005 16:54:42 -0500 (EST)
Message-ID: <200512262154.jBQLshmK018411@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <no.id> from "John David Anglin" at Dec 26, 2005 04:47:19 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> So they must come from an asm or assembly code.  I think libc used this
> reloc for loading the address of the function descriptor of main.

objdump -R nscd
...
00005970 R_PARISC_PLABEL21L  main
00005974 R_PARISC_PLABEL14R  main
00005980 R_PARISC_PLABEL21L  __libc_csu_init
00005984 R_PARISC_PLABEL14R  __libc_csu_init
00005988 R_PARISC_PLABEL21L  __libc_csu_fini
0000598c R_PARISC_PLABEL14R  __libc_csu_fini

If I recall correctly, there was a dynamic loader fix to handle these
relocations.  However, it doesn't seem to be in libc6 2.3.5-8.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
