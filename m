From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] expect hang with 2.6.7-pa14 #1
Date: Fri, 30 Jul 2004 15:03:55 -0400 (EDT)
Message-ID: <200407301903.i6UJ3uhi008711@hiauly1.hia.nrc.ca>
References: <20040730183148.GH546@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040730183148.GH546@tausq.org> from "Randolph Chung" at Jul 30,
	2004 11:31:48 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Readelf doesn't seem to know about .PARISC.unwind:
> > 
> > $ readelf -u /lib/ld.so.1
> > There are no unwind sections in this file.
> 
> yeah, this is on my list of things to fix :)

Here is the unwind table entry.

(gdb) maintenance print unwind 0x40008c38
unwind_table_entry (0x3d2d20):
        region_start = 0x40008c38 <_dl_unload_cache+104>
	region_end = 0x40008cd4 <_dl_unload_cache+260>
	flags =
	Region_description = 0x1
	Entry_FR = 0x0
	Entry_GR = 0x0
	Total_frame_size = 0x0

For some reason, the above command generates some garbage
the second time.  However, here is the descriptor for
_dl_unload_cache:

(gdb) maintenance print unwind 0x40008c00
unwind_table_entry (0x3d2d0c):
	region_start = 0x40008bd0 <_dl_unload_cache>
	region_end = 0x40008c34 <_dl_unload_cache+100>
	flags = Save_RP
	Region_description = 0x1
	Entry_FR = 0x0
	Entry_GR = 0x1
	Total_frame_size = 0x8

So, the decriptors seem ok although we have lost the name
of _dl_elf_hash.  We need to use %rp to get the address of
the caller in this case.  This can address can then be used
to get the unwind descriptor for the caller.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
