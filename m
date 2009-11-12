From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Problem with early startup in dynamic linker.
Date: Thu, 12 Nov 2009 12:40:08 -0500
Message-ID: <119aab440911120940h49107d53oad1e0dc8f91f797c@mail.gmail.com>
References: <119aab440911110634oe4a8eb2m8ff519055e7fbdf5@mail.gmail.com>
	 <20091111164114.01AE3515C@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, libc-ports@sourceware.org,
	hongjiu.lu@intel.com, linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091111164114.01AE3515C@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Nov 11, 2009 at 11:41 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> Can I use this sequence to find the address of a static local variab=
le?
>
> This will work if the local variable is in the same segment as
> the code. =A0It may work generally because I believe there is a fixed
> relationship between the code and data segments on linux (this isn't
> true on hpux). =A0The issue is whether the data is readonly or needs
> to be writeable.

CC'ing libc-ports in case anyone knows what might be wrong.

CC'ing Lu, who might have a suggestion (and is familiar with the code).=
 Hi Lu!

There is code in dl-fptr.c which is called during relocation
processing and before rtld is fully relocated.

The code in dl-fptr.c looks like this:
~~~
static struct local
  {
    struct fdesc_table *root;
    struct fdesc *free_list;
    unsigned int npages;                /* # of pages to allocate */
    /* the next to members MUST be consecutive! */
    struct fdesc_table boot_table;
    struct fdesc boot_fdescs[1024];
  }
local =3D
  {
    .root =3D &local.boot_table,
    .npages =3D 2,
    .boot_table =3D
      {
        .len =3D sizeof (local.boot_fdescs) / sizeof (local.boot_fdescs=
[0]),
        .first_unused =3D 0
      }
  };
~~~

The ".root =3D &local.boot_table," assignment causes this relocation to
be emitted:
~~~
000219d8  00000101 R_PARISC_DIR32    000024b0   .text + 1f534
~~~

This is because the address of local + 12 is not known until .text has
been relocated.

However, this appears to mean that ALL DIR32 relocs have to be
processed before the above code can be called "safely relocated" and
before any PLABEL32 (official procedure descriptor relocations) relocs
can be processed since they use this code.

A trunk build shows a crash in the dynamic loader trying to access
l->root. The value of local.root is the unrelocated address (as
computed by the linker and placed at link time into .data).

Is the solution to sort the dynamic relocations and process all DIR32
relocs first?

The alternative is this:
~~~
 local =3D
   {
-    .root =3D &local.boot_table,
+    /* Address of .boot_table is not known until runtime.  */
+    .root =3D 0,
     .npages =3D 2,
     .boot_table =3D
       {
@@ -103,6 +105,10 @@ make_fdesc (ElfW(Addr) ip, ElfW(Addr) gp)
   struct local *l;

   ELF_MACHINE_LOAD_ADDRESS (l, local);
+  /* Initialize root once.  */
+  if (l->root =3D=3D 0)
+    l->root =3D &l->boot_table;
~~~
This removes the relocation against local.

This fixes the dynamic linker segmentation fault in early startup
while trying to relocate a PLABEL32 reloc before all of the DIR32
relocs.

Are the changes to dl-fptr.c the right solution?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
