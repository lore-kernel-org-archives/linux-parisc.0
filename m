From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't compile kernel for parisc
Date: Mon, 2 Mar 2009 13:17:18 -0500 (EST)
Message-ID: <20090302181719.8CB8F4ED1@hiauly1.hia.nrc.ca>
References: <a4423d670903021001y2ebdfc41md4f5007144ac8ec9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: a.beregalov@gmail.com (Alexander Beregalov)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670903021001y2ebdfc41md4f5007144ac8ec9@mail.gmail.com> from "Alexander Beregalov" at Mar 2, 2009 09:01:02 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Either hsh->target_section->owner or hsh->bh_root.string is NULL. =C2=A0C=
> ould
> > you put a break on this line and print the struct hsh in gdb?
> 
> bfd/elf32-hppa.c:
> 3568   /* Make sure we can reach the stub.  */
> 3569   if (max_branch_offset !=3D 0
> 3570       && value + addend + max_branch_offset >=3D 2*max_branch_offset)
> 3571     {
> 3572       (*_bfd_error_handler)
> 3573         (_("%B(%A+0x%lx): cannot reach %s, recompile with
> -ffunction-sections"),
> 3574          input_bfd,
> 3575          input_section,
> 3576          offset,
> 3577          hsh->bh_root.string);
> 3578       bfd_set_error (bfd_error_bad_value);
> 3579       return bfd_reloc_notsupported;
> 3580     }
> 
> (gdb) step
> 3572          (*_bfd_error_handler)

...

> (gdb) print hsh->bh_root.string
> No symbol "hsh" in current context.

> I do not understand why there is no such symbols.

As soon as you step into the error handler, you change the function
context.  So, there is no local symbol hsh there.  It's also possible
the symbol hsh is optimized away, particularly because of the way it's
derived fro the argument bh.

If hsh is not available, try bh->bh_root.  hsh is derived from
bh as follows:

  hsh = (struct bfd_hash_entry *) bh;

It's always tricky to debug optimized code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
