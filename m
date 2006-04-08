From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] bfd tls bug?
Date: Sat, 8 Apr 2006 12:14:13 -0400
Message-ID: <119aab440604080914h3ad85b9fsa54876804279ed0b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: "Randolph Chung" <randolph@tausq.org>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
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

Randolph,

bfd/elf32-hppa.c
   4168                     need_relocs =3D TRUE;
   4169                     loc =3D htab->srelgot->contents;
   4170                     /* FIXME (CAO): Should this be reloc_count++ ? =
*/
   4171                     loc +=3D htab->srelgot->reloc_count * sizeof
(Elf32_External_Rela);

Should there be a reloc_count++ there?
Or is this taken into account earlier?

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
