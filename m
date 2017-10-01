From: John David Anglin <dave.anglin@bell.net>
Subject: Re: HP-UX for C8000
Date: Sun, 1 Oct 2017 10:11:42 -0400
Message-ID: <77C25382-EF4C-4AE5-9860-A23777D29B1E@bell.net>
References: <20170930152506.GA10542@alpha.franken.de> <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net> <20171001114626.GA16118@alpha.franken.de> <F6CD5540-CC99-4D7B-8625-3757D8F05BC6@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Tom Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <F6CD5540-CC99-4D7B-8625-3757D8F05BC6@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-10-01, at 9:20 AM, John David Anglin wrote:

>> 
>> Does anybody know HP-UX ? Could I mmap the register of quicksilver
>> and dump it from user space ?
> 
> Manpage for mmap says:
> 
>      The mmap() function is supported for regular files.  Support for any
>      other type of file is unspecified.
> 
> If there is a device, possibly one can use dd.

There are also /dev/mem and /dev/kmem:

 mem(7)                                                               mem(7)

 NAME
      mem - main memory

 DESCRIPTION
      mem is a special file that is an image of the main memory of the
      computer.  It may be used, for example, to examine and patch the
      system.

      Byte addresses in mem are interpreted as physical memory addresses.
      References to non-existent locations cause errors to be returned.

      File kmem is the same as mem except that kernel virtual memory rather
      than physical memory is accessed.  Please refer to kmem(7) for
      information about ioctl operations that are supported on /dev/kmem.
...

 NAME
      kmem - perform I/O on kernel memory based on symbol name.

Dave
--
John David Anglin	dave.anglin@bell.net



