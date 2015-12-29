From: John David Anglin <dave.anglin@bell.net>
Subject: dladdr returns wrong names on hppa
Date: Tue, 29 Dec 2015 13:35:19 -0500
Message-ID: <05E7B0DC-DFD7-4B04-B6DE-DF20E8B64B83@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

There was an old message from Guy Martin regarding dladdr not working on hppa:
http://permalink.gmane.org/gmane.linux.ports.hppa/1423

The Debian nss package fails to build because of a dladdr problem:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=791537

I created a small test program and a glibc bug report:
https://sourceware.org/bugzilla/show_bug.cgi?id=19415

This code seems wrong on hppa:

ElfW(Addr)
_dl_lookup_address (const void *address)
{
  ElfW(Addr) addr = (ElfW(Addr)) address;
  struct fdesc_table *t;
  unsigned long int i;

  for (t = local.root; t != NULL; t = t->next)
    {
      i = (struct fdesc *) addr - &t->fdesc[0];
      if (i < t->first_unused && addr == (ElfW(Addr)) &t->fdesc[i])
        {
          addr = t->fdesc[i].ip;
          break;
        }
    }

  return addr;
}

Dave
--
John David Anglin	dave.anglin@bell.net



