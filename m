Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.goquest.com (ns1.goquest.com [12.18.108.6])
	by dsl2.external.hp.com (Postfix) with SMTP id D2EF2487A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Nov 2003 20:17:07 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@goquest.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Linux on HP
Date: Fri, 14 Nov 2003 21:16:51 -0600
References: <002901c3aad6$87fb1c10$64d71399@Damian>
In-Reply-To: <002901c3aad6$87fb1c10$64d71399@Damian>
MIME-Version: 1.0
Message-Id: <03111421165101.01237@wolf686>
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

On Friday 14 November 2003 11:41 am, Damian Muchli?ski wrote:
> Hello
>
> I'm trying to set-up linux on HP computer. First I've tried Debian Stable
> Woody relase with 2.4.17 kernel but i got message WARNING! Stack pointer
> and cr30 do not correspond! I've found on newsgroup that because of old
> version of gcc and kernel and I should use newer version. So I have
> downloaded palinux-2.4.22-pa13-20031022-netinst.iso from your
> website,check md5, burned and booted.
> Unfortunately it hangs on "searching for devices" without any more info.
>
You might try letting it set at that point for a good while, like go out to
lunch.
There was (perhaps still is) a problem on some machines where the
device search took approximately forever.
Mike
