From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] expect hang with 2.6.7-pa14 #1
Date: Fri, 30 Jul 2004 15:45:17 -0400 (EDT)
Message-ID: <200407301945.i6UJjIp1008994@hiauly1.hia.nrc.ca>
References: <200407301903.i6UJ3uhi008711@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200407301903.i6UJ3uhi008711@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Jul 30, 2004 03:03:55 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Here is the unwind table entry.
> 
> (gdb) maintenance print unwind 0x40008c38
> unwind_table_entry (0x3d2d20):
>         region_start = 0x40008c38 <_dl_unload_cache+104>
> 	region_end = 0x40008cd4 <_dl_unload_cache+260>
> 	flags =
> 	Region_description = 0x1
> 	Entry_FR = 0x0
> 	Entry_GR = 0x0
> 	Total_frame_size = 0x0
> 
> (gdb) maintenance print unwind 0x40008c00
> unwind_table_entry (0x3d2d0c):
> 	region_start = 0x40008bd0 <_dl_unload_cache>
> 	region_end = 0x40008c34 <_dl_unload_cache+100>
> 	flags = Save_RP
> 	Region_description = 0x1
> 	Entry_FR = 0x0
> 	Entry_GR = 0x1
> 	Total_frame_size = 0x8

As I suspected, there is confusion regarding which unwind descriptor
to use:

(gdb) bt
#0  0x40008c38 in _dl_unload_cache () from /lib/ld.so.1
{ hppa_frame_cache (frame=-1) -> { find_unwind_entry 0x40008bd0 -> 0x3d2d0c (cached) }
{ find_unwind_entry 0x40008bd0 -> 0x3d2d0c (cached) }
{ find_unwind_entry 0x40008bd0 -> 0x3d2d0c (cached) }
 (this_sp=0xbff037c0, pc=0x40008c38, prologue_end=0x40008bd8)  (base=0xbff03780) [unwind adjust] } base=0xbff03780 }{ hppa_frame_cache (frame=-1) -> base=0xbff03780 (cached) }#1  0x00000000 in ?? ()
 { hppa_frame_cache (frame=-1) -> base=0xbff03780 (cached) }{ hppa_frame_cache (frame=-1) -> base=0xbff03780 (cached) }#2  0x00000000 in ?? ()
 { hppa_frame_cache (frame=-1) -> base=0xbff03780 (cached) }Previous frame identical to this frame (corrupt stack?)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
