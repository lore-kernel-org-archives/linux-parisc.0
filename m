Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "geezer" <geezer@snet.net>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
In-Reply-To: Message from "geezer" <geezer@snet.net>
   of "Sun, 13 Jan 2002 15:34:53 EST." <002f01c19c71$c1fe71c0$6401a8c0@downstairs>
References: <002f01c19c71$c1fe71c0$6401a8c0@downstairs> 
Date: Sun, 13 Jan 2002 15:07:23 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020113220723.673A7482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: sid vs woody (was 715/50)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

"geezer" wrote:
> So the palinux-0.9-README file says "YOU MUST INSTALL 'sid'", blah, =
> blah, blah...

Uhm...which release? URL or from an ISO?

> I get "failed getting release file file:/instmnt/dists/sid/Release"
> The woody one installs OK, but I am not sure how "crippled" I may be =
> with it.
> Any ideas?  What more can I tell you to help with the diagnosis?

For 0.9.3, woody is correct. You won't be very crippled at all.

With "sid", plan on hppa being broken occasionally. I expect "woody"
to be more stable - IMHO better for folks who just want to use debian.
Newer kernel (compared to 0.9.3 ISO) from ftp.parisc-linux.org
will work for either release.

For the adventerous, edit the /etc/apt/sources.list to point
to "sid" like this:

deb http://http.us.debian.org/debian sid main contrib non-free
deb http://non-us.debian.org/debian-non-US sid/non-US main contrib non-free

Then do "apt-get update" and "apt-get dist-upgrade".

grant
