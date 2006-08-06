From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] /bin/sh: undefined symbol: execve
Date: Sun, 6 Aug 2006 17:09:20 -0400
Message-ID: <119aab440608061409h774f8401p7bf8b441337aa615@mail.gmail.com>
References: <200608061805.k76I5gk1015076@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: carlos@codesourcery.com,
 parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200608061805.k76I5gk1015076@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 8/6/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> I see these errors of gsyprf11 (SMP 64-bit kernel).  I don't see
> the fails on hiauly6 (UP 32-bit kernel).  I believe that these
> lookup errors are from the dynamic loader.  execve is undefined in
> /bin/sh but it should be resolved by libc.
>
> The fails aren't consistent from run to run, so there appears to
> be a race condition somewhere in the lookup process.
>
> Thoughts?

It is unlikely the generic code has a race condition. However, because
we return a "struct fdesc" from the lookup routines, we have to be
very careful. This small structure is copied by value, and the copy is
*not* atomic. There is code to ensure that the last thing we write
into the fdesc is the IP. Please look at the "struct fdesc" code in
libc-ports/sysdeps/hppa/dl-machine.h. It's all upstream.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
