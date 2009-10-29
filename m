From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Out of order unwind entry warning
Date: Thu, 29 Oct 2009 17:07:32 -0400 (EDT)
Message-ID: <20091029210733.96E8B4E38@hiauly1.hia.nrc.ca>
References: <4AE9FF22.1090709@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AE9FF22.1090709@gmx.de> from "Helge Deller" at Oct 29, 2009 09:46:26 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Still need to look at readelf -u on .o's.
> 
> Yes, I see this too. readelf -u doesn't print any longer the second line of:
> <arch_mod_section_prepend>: [0x1011fc4c-0x1011fc74]
>            Entry_GR=1 Save_SP Total_frame_size=8

Actually, the entries are still there.  For weak functions that
are not used, they appear as "<foo+x>:" where foo is the closest
preceding symbol before the unused weak function.  In practice,
the code shouldn't be entered, so the lack of an associated function
symbol shouldn't matter.

I have a fix for the readelf -u bug.  See below.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: readelf.c
===================================================================
RCS file: /cvs/src/src/binutils/readelf.c,v
retrieving revision 1.467
diff -u -3 -p -r1.467 readelf.c
--- readelf.c	23 Oct 2009 00:15:07 -0000	1.467
+++ readelf.c	29 Oct 2009 20:59:26 -0000
@@ -5589,11 +5589,11 @@ slurp_hppa_unwind_table (FILE * file,
 	    {
 	    case 0:
 	      aux->table[i].start.section = sym->st_shndx;
-	      aux->table[i].start.offset += sym->st_value + rp->r_addend;
+	      aux->table[i].start.offset  = sym->st_value + rp->r_addend;
 	      break;
 	    case 1:
 	      aux->table[i].end.section   = sym->st_shndx;
-	      aux->table[i].end.offset   += sym->st_value + rp->r_addend;
+	      aux->table[i].end.offset    = sym->st_value + rp->r_addend;
 	      break;
 	    default:
 	      break;
