From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: HPPA and Squeeze
Date: Tue, 16 Jun 2009 21:13:17 +0200
Message-ID: <20090616191317.GG25535@hall.aurel32.net>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org> <4A31FA76.20103@debian.org> <20090615173102.GC2690@lackof.org> <20090616062531.GA17957@xanadu.blop.info> <4A37EDB5.2020400@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Cc: Lucas Nussbaum <lucas@lucas-nussbaum.net>, Helge Deller <deller@gmx.de>,
	Grant Grundler <grundler@parisc-linux.org>,
	HPPA porters <debian-hppa@lists.debian.org>,
	Debian Release <debian-release@lists.debian.org>,
	admin@debian-ports.org, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <4A37EDB5.2020400@gmx.de>
Resent-Message-ID: <IBDO7OydSyL.A.HDD.b7-NKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Tue, Jun 16, 2009 at 09:08:37PM +0200, Helge Deller wrote:
> On 06/16/2009 08:25 AM, Lucas Nussbaum wrote:
>> On 15/06/09 at 11:31 -0600, Grant Grundler wrote:
>> PS: if you want an HPPA-specific issue to play with,
>> http://experimental.debian.net/fetch.php?&pkg=ruby1.9&ver=1.9.0.1-5&arch=hppa&stamp=1213563978&file=log&as=raw
>> might be a good candidate.
>
> In reality it's not (any longer) a hppa specific bug. It's a bug in ruby.
> Ruby just relies on NPTL specific behaviour of threads and as such plays mad on LinuxThreads, which we still have active on hppa.
> The good thing is, that the NPTL switch-over was started by Carlos, so I expect that this should be fixed when NPTL hits unstable...
>

BTW, Carlos, could you please send me the latest version of your
patches, so that we can actually do the switch with version 2.10?

-- 
Aurelien Jarno	                        GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net
