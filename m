From: Helge Deller <deller@gmx.de>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset	Table
Date: Sat, 01 Aug 2009 01:45:30 +0200
Message-ID: <4A73821A.4020506@gmx.de>
References: <119aab440907311413s2e5ef1ebl690fff1bc4f0daea@mail.gmail.com> <20090731212634.737DB4CFD@hiauly1.hia.nrc.ca> <119aab440907311500v14b192e7t8a244d9d3b2c482e@mail.gmail.com> <20090731233828.GF26333@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090002020306030204060209"
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	elendil@planet.nl, 539378@bugs.debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	randolph@tausq.org, submit@bugs.debian.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090731233828.GF26333@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------090002020306030204060209
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2009 01:38 AM, Kyle McMartin wrote:
> On Fri, Jul 31, 2009 at 06:00:48PM -0400, Carlos O'Donell wrote:
>> On Fri, Jul 31, 2009 at 5:26 PM, John David
>> Anglin<dave@hiauly1.hia.nrc.ca>  wrote:
>>> I don't have more details...  The idea is as Carlos outlined.  There's
>>> code in the binutils elf32-hppa.c and elf64-hppa.c files to implement
>>> the above for dynamic libraries.  That's what made me think of it.
>> Binutils is not involved in the kernel module loader, instead
>> arch/parisc/kernel/module.c (get_fdesc) chooses where the gp will
>> point to.
>>
>> If you set gp to the middle of the GOT table, *and* implement
>> long/short ldd access on 64-bit, then you would get a total of 8191
>> possible slots per module.
>>
>> Personally I think the lower risk, quicker fix, is to implement a fix
>> for 64-bit kernels that uses ldd in format 3 for all offsets>  15
>> bytes, and thus allow you to set MAX_GOTS to 4095.
>>
>> Note: ldd format 3 can't be used to load immediate values between 15
>> and -16 bytes.
>>
>
> Is it as simple as:
>
> diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
> index ef5caf2..0502fab 100644
> --- a/arch/parisc/kernel/module.c
> +++ b/arch/parisc/kernel/module.c
> @@ -82,13 +82,6 @@
>   		return -ENOEXEC;			\
>   	}
>
> -/* Maximum number of GOT entries. We use a long displacement ldd from
> - * the bottom of the table, which has a maximum signed displacement of
> - * 0x3fff; however, since we're only going forward, this becomes
> - * 0x1fff, and thus, since each GOT entry is 8 bytes long we can have
> - * at most 1023 entries */
> -#define MAX_GOTS	1023
> -
>   /* three functions to determine where in the module core
>    * or init pieces the location is */
>   static inline int in_init(struct module *me, void *loc)
> @@ -126,6 +119,14 @@ struct stub_entry {
>   };
>   #endif
>
> +/* Maximum number of GOT entries. We use a long displacement ldd from
> + * the bottom of the table, which has 16-bit signed displacement from
> + * %dp. Because we only use the forward direction, we're limited to
> + * 15-bits - 1, and because each GOT entry is 8-bytes wide, we're limited
> + * to 4095 entries.
> + */
> +#define MAX_GOTS	(((1<<  15) - 1) / sizeof(struct got_entry))
> +
>   /* Field selection types defined by hppa */
>   #define rnd(x)			(((x)+0x1000)&~0x1fff)
>   /* fsel: full 32 bits */
> @@ -151,6 +152,15 @@ static inline int reassemble_14(int as14)
>   		((as14&  0x2000)>>  13));
>   }
>
> +/* Unusual 16-bit encoding, for wide mode only.  */
> +static inline int reassemble_16a(int as16)
> +{
> +	int s, t;
> +	t = (as16<<  1)&  0xffff;
> +	s = (as16&  0x8000);
> +	return (t ^ s ^ (s>>  1)) | (s>>  15);
> +}
> +
>   static inline int reassemble_17(int as17)
>   {
>   	return (((as17&  0x10000)>>  16) |
> @@ -460,12 +470,16 @@ static Elf_Addr get_stub(struct module *me, unsigned long value, long addend,
>    */
>   	switch (stub_type) {
>   	case ELF_STUB_GOT:
> +		unsigned int d = get_got(me, value, addend)&  0x7fff;
> +
>   		stub->insns[0] = 0x537b0000;	/* ldd 0(%dp),%dp	*/
>   		stub->insns[1] = 0x53610020;	/* ldd 10(%dp),%r1	*/
>   		stub->insns[2] = 0xe820d000;	/* bve (%r1)		*/
>   		stub->insns[3] = 0x537b0030;	/* ldd 18(%dp),%dp	*/
>
> -		stub->insns[0] |= reassemble_14(get_got(me, value, addend)&  0x3fff);
> +		if (d>  15)
> +			stub->insns[0] |= reassemble_16a(d);
> +
>   		break;
>   	case ELF_STUB_MILLI:
>   		stub->insns[0] = 0x20200000;	/* ldil 0,%r1		*/
>
> I don't think we need to worry about the initial 15-bytes displacement,
> since they're all within the first got_entry? (The resulting assembly
> looks alright from a 64-bit toolchain:
>
> kyle@shortfin ~ $ cat foo.S
> 	.text
> a:
> 	ldd 32760(%r27),%r27
> 	break	0,0
>
> 0000000000000000<a>:
>     0:	53 7b ff f0 	ldd 7ff8(dp),dp
>
> int main(void) {
>          unsigned int opcode = 0x537b0000;
>          opcode |= re_assemble_16(32760);
>          printf("0x%x\n", opcode);
>          return 0;
> }
>
> kyle@shortfin ~ $ ./foo
> 0x537bfff0
>
> Looks pretty happy?
>

Kyle, you beat me.
Attached is my patch ....

Tested and works.

root@c3000:~# uname -a
Linux c3000 2.6.31-rc4-64bit #42 SMP Sat Aug 1 01:37:29 CEST 2009 parisc64 GNU/Linux
root@c3000:~# lsmod
Module                  Size  Used by
ipv6                  493320  70
reiserfs              461624  0
nfs                   300704  0
lockd                 144456  1 nfs
nfs_acl                 5592  1 nfs
sunrpc                382312  3 nfs,lockd,nfs_acl
msdos                  15032  0
fat                    91248  1 msdos

Helge

--------------090002020306030204060209
Content-Type: text/x-patch;
 name="got.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="got.patch"

parisc: module.c - fix GOT table overflow with large kernel modules on 64 bit kernels

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index ef5caf2..d280219 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -86,8 +86,12 @@
  * the bottom of the table, which has a maximum signed displacement of
  * 0x3fff; however, since we're only going forward, this becomes
  * 0x1fff, and thus, since each GOT entry is 8 bytes long we can have
- * at most 1023 entries */
-#define MAX_GOTS	1023
+ * at most 1023 entries.
+ * To overcome this 14bit displacement with some kernel modules, we'll
+ * use instead the unusal 16bit displacement method (see reassemble_16a)
+ * which gives us a maximum positive displacement of 0x7fff, and as such 
+ * allows us to allocate up to 4095 GOT entries. */
+#define MAX_GOTS	4095
 
 /* three functions to determine where in the module core
  * or init pieces the location is */
@@ -151,6 +155,17 @@ static inline int reassemble_14(int as14)
 		((as14 & 0x2000) >> 13));
 }
 
+static inline int reassemble_16a(int as16)
+{
+	int s, t;
+
+	/* Unusual 16-bit encoding, for wide mode only.  */
+	t = (as16 << 1) & 0xffff;
+	s = (as16 & 0x8000);
+	return (t ^ s ^ (s >> 1)) | (s >> 15);
+}
+
+
 static inline int reassemble_17(int as17)
 {
 	return (((as17 & 0x10000) >> 16) |
@@ -407,6 +422,7 @@ static Elf_Addr get_stub(struct module *me, unsigned long value, long addend,
 	enum elf_stub_type stub_type, Elf_Addr loc0, unsigned int targetsec)
 {
 	struct stub_entry *stub;
+	int d;
 
 	/* initialize stub_offset to point in front of the section */
 	if (!me->arch.section[targetsec].stub_offset) {
@@ -460,12 +476,17 @@ static Elf_Addr get_stub(struct module *me, unsigned long value, long addend,
  */
 	switch (stub_type) {
 	case ELF_STUB_GOT:
-		stub->insns[0] = 0x537b0000;	/* ldd 0(%dp),%dp	*/
+		stub->insns[0] = 0x537b0000;    /* ldd 0(%dp),%dp	*/
 		stub->insns[1] = 0x53610020;	/* ldd 10(%dp),%r1	*/
 		stub->insns[2] = 0xe820d000;	/* bve (%r1)		*/
 		stub->insns[3] = 0x537b0030;	/* ldd 18(%dp),%dp	*/
 
-		stub->insns[0] |= reassemble_14(get_got(me, value, addend) & 0x3fff);
+		d = get_got(me, value, addend);
+		if (d <= 15)
+			stub->insns[0] |= reassemble_14(d);
+		else
+			stub->insns[0] |= reassemble_16a(d);
+
 		break;
 	case ELF_STUB_MILLI:
 		stub->insns[0] = 0x20200000;	/* ldil 0,%r1		*/

--------------090002020306030204060209--
