From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: resource_size_t printk woes...
Date: Thu, 1 Jan 2009 14:04:45 -0500 (EST)
Message-ID: <20090101190446.A26994EDA@hiauly1.hia.nrc.ca>
References: <495CFE20.2000702@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <495CFE20.2000702@gmx.de> from "Helge Deller" at Jan 1, 2009 06:32:16 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> John David Anglin wrote:
> > Hi Helge,
> > 
> > I just want to say that I like Kyle's approach.  There already exists
> > the 'R' modifier for %p.  This outputs a pair of resource_size_t values.
> > We just need a modifier to handle the printing of the start value in
> > a manner similar to that for the 'R' modifier.  So, I think this issue
> > needs another go around.
> 
> Sadly none of the approaches is really nice, as with Kyle's approach we'd
> loose the type-checking of printk.
> But yes, maybe that's the best choice of all bad ones.
> Will you try/come up with a patch to vsprintf.c?

I was think of something like this (untested):

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a013bbc..3c47705 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -551,8 +551,6 @@ static char *symbol_string(char *buf, char *end, void *ptr, int field_width, int
 #endif
 }
 
-static char *resource_string(char *buf, char *end, struct resource *res, int field_width, int precision, int flags)
-{
 #ifndef IO_RSRC_PRINTK_SIZE
 #define IO_RSRC_PRINTK_SIZE	4
 #endif
@@ -561,6 +559,8 @@ static char *resource_string(char *buf, char *end, struct resource *res, int fie
 #define MEM_RSRC_PRINTK_SIZE	8
 #endif
 
+static char *resource_string(char *buf, char *end, struct resource *res, int field_width, int precision, int flags)
+{
 	/* room for the actual numbers, the two "0x", -, [, ] and the final zero */
 	char sym[4*sizeof(resource_size_t) + 8];
 	char *p = sym, *pend = sym + sizeof(sym);
@@ -581,6 +581,24 @@ static char *resource_string(char *buf, char *end, struct resource *res, int fie
 	return string(buf, end, sym, field_width, precision, flags);
 }
 
+static char *resource_start_string(char *buf, char *end, struct resource *res, int field_width, int precision, int flags)
+{
+	/* room for the number, the "0x", and the final zero */
+	char sym[2*sizeof(resource_size_t) + 3];
+	char *p = sym, *pend = sym + sizeof(sym);
+	int size = -1;
+
+	if (res->flags & IORESOURCE_IO)
+		size = IO_RSRC_PRINTK_SIZE;
+	else if (res->flags & IORESOURCE_MEM)
+		size = MEM_RSRC_PRINTK_SIZE;
+
+	p = number(p, pend, res->start, 16, size, -1, SPECIAL | SMALL | ZEROPAD);
+	*p = 0;
+
+	return string(buf, end, sym, field_width, precision, flags);
+}
+
 /*
  * Show a '%p' thing.  A kernel extension is that the '%p' is followed
  * by an extra set of alphanumeric characters that are extended format
@@ -592,6 +610,7 @@ static char *resource_string(char *buf, char *end, struct resource *res, int fie
  * - 'S' For symbolic direct pointers
  * - 'R' For a struct resource pointer, it prints the range of
  *       addresses (not the name nor the flags)
+ * - 'Z' For a struct resource pointer, it prints the start address
  *
  * Note: The difference between 'S' and 'F' is that on ia64 and ppc64
  * function pointers are really function descriptors, which contain a
@@ -607,6 +626,8 @@ static char *pointer(const char *fmt, char *buf, char *end, void *ptr, int field
 		return symbol_string(buf, end, ptr, field_width, precision, flags);
 	case 'R':
 		return resource_string(buf, end, ptr, field_width, precision, flags);
+	case 'Z':
+		return resource_start_string(buf, end, ptr, field_width, precision, flags);
 	}
 	flags |= SMALL;
 	if (field_width == -1) {

So, one would just pass the resource pointer.  This has the advantage that
it handles 4 and 8 hex digits when appropriate.  However, it is limited to
just printing the start address.  In most cases, that's all that is done.

The 'R' modifier can be used to print both the start and end values.  There
are a few cases where a range is printed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
