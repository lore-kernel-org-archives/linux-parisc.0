Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA06921
	for <parisc-linux@puffin.external.hp.com>; Sat, 19 Aug 2000 16:01:18 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 19 Aug 2000 22:01:05 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
References: <Pine.LNX.4.21.0008190020150.9244-100000@front.linuxcare.com.au> <8766oy1nxa.fsf@linuxcare.com> <87vgwyz5r0.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 19 Aug 2000 18:00:21 -0400
In-Reply-To: David Huggins-Daines's message of "18 Aug 2000 16:14:27 -0400"
Message-ID: <87r97kzzbe.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> @@ -1961,8 +1961,8 @@
>        || (h->elf_link_hash_flags & ELF_LINK_HASH_NEEDS_PLT) != 0)
>      {
>        if (h->plt.refcount <= 0
> +	  || h->root.type == bfd_link_hash_undefweak
>  	  || ((h->elf_link_hash_flags & ELF_LINK_HASH_DEF_REGULAR) != 0
> -	      && h->root.type != bfd_link_hash_defweak
>  	      && (!info->shared || info->symbolic)
>  	      && !(!info->shared
>  		   && (h->root.type == bfd_link_hash_defined

This chunk needs to also check for undefined symbols, it seems.
Here's a better one:

@@ -1961,8 +1961,9 @@
       || (h->elf_link_hash_flags & ELF_LINK_HASH_NEEDS_PLT) != 0)
     {
       if (h->plt.refcount <= 0
+	  || h->root.type == bfd_link_hash_undefweak
+	  || h->root.type == bfd_link_hash_undefined
 	  || ((h->elf_link_hash_flags & ELF_LINK_HASH_DEF_REGULAR) != 0
-	      && h->root.type != bfd_link_hash_defweak
 	      && (!info->shared || info->symbolic)
 	      && !(!info->shared
 		   && (h->root.type == bfd_link_hash_defined


-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
