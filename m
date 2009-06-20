From: Thibaut VARENE <varenet@debian.org>
Subject: Re: HPPA and Squeeze
Date: Sat, 20 Jun 2009 16:51:05 +0200
Message-ID: <7d01f9f00906200751t164cd324v2438fc38b9dc517f@mail.gmail.com>
References: <4A3B2AC4.90105@debian.org> <20090619151526.GA30984@roeckx.be>
	 <20090620143944.GA20338@roeckx.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Luk Claes <luk@debian.org>,
	"debian-hppa@lists.debian.org" <debian-hppa@lists.debian.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Debian Release <debian-release@lists.debian.org>
To: Kurt Roeckx <kurt@roeckx.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090620143944.GA20338@roeckx.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jun 20, 2009 at 4:39 PM, Kurt Roeckx<kurt@roeckx.be> wrote:
> On Fri, Jun 19, 2009 at 05:15:26PM +0200, Kurt Roeckx wrote:
>> So it's my understanding that the porters have no idea about the
>> problems. =C2=A0So I will start to mail you about problems as soon
>> as I see them and they look like porting issues specific
>> to hppa.
>
> Ruby1.9 hangs in test_thread.rb and gets killed after
> 150 minutes of inactivity. =C2=A0I assume NPTL will fix this.

yes, it's a ruby bug, it's been explained on this m-l already.
Ruby's implementation cannot handle linuxthreads.

--=20
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
