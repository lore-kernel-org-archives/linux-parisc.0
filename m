Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8885C483C
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 14:06:32 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B6Fa3-0006X3-GO; Wed, 24 Mar 2004 21:06:31 +0000
Date: Wed, 24 Mar 2004 21:06:31 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Cast of lvalue warning in the last k 2.6.5-rc2
	with	last gcc-3.3 (next)
Message-ID: <20040324210631.GN25059@parcelfarce.linux.theplanet.co.uk>
References: <40561EAF000053B8@ocpmta1.freegates.net>
	<40561E710000662F@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40561E710000662F@ocpmta2.freegates.net>
Sender: <willy@www.linux.org.uk>
Cc: PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Mar 24, 2004 at 04:54:52PM +0100, Joel Soete wrote:
> here is the next io.c diff file proposal (if some interest :) )
> --- arch/parisc/lib/io.c.orig	2004-03-24 14:47:42.703516192 +0100
> +++ arch/parisc/lib/io.c	2004-03-24 14:52:46.808285240 +0100
> @@ -21,19 +21,19 @@
>  		goto bytecopy;
>  	while (dest & 3) {
>  		writeb(*(char *)src, dest++);
> -		((char *)src)++;
> -		count--;
> +		src += sizeof(char);
> +		count -= sizeof(char);

eww.  Here's my attempt at something similar:

@@ -20,8 +20,9 @@ void __memcpy_toio(unsigned long dest, u
        if ((dest & 3) != (src & 3))
                goto bytecopy;
        while (dest & 3) {
-               writeb(*(char *)src, dest++);
-               ((char *)src)++;
+               writeb(*(char *)src, dest);
+               src++;
+               dest++;
                count--;
        }
        while (count > 3) {


>  	}
>  	while (count > 3) {
>  		__raw_writel(*(u32 *)src, dest);
> -		src += 4;
> -		dest += 4;
> -		count -= 4;
> +		src += sizeof(u32);
> +		dest += sizeof(u32);
> +		count -= sizeof(u32);

No, don't change these.

>   bytecopy:
>  	while (count--) {
>  		writeb(*(char *)src, dest++);
> -		((char *)src)++;
> +		src += sizeof(char);

...
-               writeb(*(char *)src, dest++);
-               ((char *)src)++;
+               writeb(*(char *)src, dest);
+               src++;
+               dest++;
...

I don't have time to finish off this patch right now.  Want to take a
stab at redoing it?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
