From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Comments?
Date: Sat, 5 Mar 2005 19:22:27 -0500 (EST)
Message-ID: <200503060022.j260MRjc001063@hiauly1.hia.nrc.ca>
References: <200503052153.j25LrOQW014375@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503052153.j25LrOQW014375@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Mar 5, 2005 04:53:23 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Ok, ld is broken in the binutils CVS head.
> __canonicalize_funcptr_for_compare doesn't load the correct address
> for _GLOBAL_OFFSET_TABLE_ in shared libraries.  It loads the address
> used by main.  As a result, it thinks the plabel for the function
> has been resolved ;(

Found it:

2004-11-02  Hans-Peter Nilsson  <hp@axis.com>

        * elflink.c (_bfd_elf_create_got_section): Hide _GLOBAL_OFFSET_TABLE_.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
