From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] Re: Comments?
Date: Tue, 8 Mar 2005 12:32:36 -0500
Message-ID: <20050308173236.GS23803@baldric.uwo.ca>
References: <200503052153.j25LrOQW014375@hiauly1.hia.nrc.ca>
	<200503060022.j260MRjc001063@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 tausq@debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503060022.j260MRjc001063@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Mar 05, 2005 at 07:22:27PM -0500, John David Anglin wrote:
> > Ok, ld is broken in the binutils CVS head.
> > __canonicalize_funcptr_for_compare doesn't load the correct address
> > for _GLOBAL_OFFSET_TABLE_ in shared libraries.  It loads the address
> > used by main.  As a result, it thinks the plabel for the function
> > has been resolved ;(
> 
> Found it:
> 
> 2004-11-02  Hans-Peter Nilsson  <hp@axis.com>
> 
>         * elflink.c (_bfd_elf_create_got_section): Hide _GLOBAL_OFFSET_TABLE_.

I'd seen that fly by on binutils and it caused a certain amount of grief
in glibc. I'm not quite sure what the rational was behind hiding _GOT_.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
