Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA06372
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Jan 2000 18:22:39 -0700
Date: Wed, 12 Jan 2000 19:22:53 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: Philipp Rumpf <prumpf@mkp.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C360 shellprompt
Message-ID: <20000112192253.F11300@thepuffingroup.com>
References: <20000111155321.A14792@tux.mkp.net> <20000112164152.C11300@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000112164152.C11300@thepuffingroup.com>; from Matthew Wilcox on Wed, Jan 12, 2000 at 04:41:52PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 12, 2000 at 04:41:52PM -0500, Matthew Wilcox wrote:
[...]
> bad magic 6a930530 (should be c0030a80), wq bug, forcing oops.

Found this one.  It's my fault in the HIL driver.  Turn off CONFIG_HIL
and things progress further:

execve /sbin/init c00df008 c00df030
do_execve
reading c005cf70 cffe8808 cffe85c8 128
pgc bad case
getting new pages ...
got c144c040 to c144c43c
gcp 00000000 19 0 = c144c040 (c005cc7c)
readpage: c006ddc8
page_ok
returned 128
02100108 05124000 00000000 00000000
00000000 00000000 000039c3 00000080
000000b4 00045574 40006d38 00000138
00000004 000001c8 00000013 000004fc
00000000 000004fc 000001e8 000004c0
00000003 000006e4 00000000 000006e4
00000000 000006e4 00000000 000006e4
00000000 00045000 00000574 4702100b
gcp 2001f000 19 0 = c144c43c (c007277c)

[ i thought that bit might be of interest ]

map_som_binary
do_mmap cff260e0 00001000 0003f000 00000005 00001806 00000000
miscoloured mmap
do_mmap cff260e0 40001000 00006000 00000007 00001806 0003f000
miscoloured mmap
do_mmap 00000000 40007000 0000f000 00000007 00000006 00000000
miscoloured mmap

which looks slightly offputting.

stack_base 2001f000 cff1f000
mem_map disagrees with c144c43c at 2001f000
set_pte cff2007c 0ff1f047
create_som_tables
sp 2001ffd8
hey.

the `disagrees' part made me snip this little section out.

The last lines before I get nothing more reads:

gcp 0000e000 19 0 = c144c3f8 (c005bb9c)
pgc bad case
getting new pages ...
got c144b7c0 to c144bbbc
gcp 0000f000 19 0 = c144bbbc (c005bb9c)
gcp 00003000 21 0 = c144b88c (c005d550)
new_page c144b88c flags 00000000
new_page c144b88c flags 00000000
cfef3000 cff12000
new_page c144b88c flags 00000000
new_page c144b88c flags 00000000
set_pte cff0f00c 0fef300b

so i don't actually get a prompt on the c3k, but we're closer.
On the A180, it stops right before the `hey'.  It has the same
value for `sp' as the C3k.
