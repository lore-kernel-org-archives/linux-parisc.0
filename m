From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] Sound problems on a C3600
Date: Sun, 22 Apr 2007 06:03:21 +0200
Message-ID: <7d01f9f00704212103q1c6f8d42lc275946dceb8a893__27530.3748589524$1416624338$gmane$org@mail.gmail.com>
References: <462A3C0D.8090004@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Julian Stecklina" <der_julian@web.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <462A3C0D.8090004@web.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 4/21/07, Julian Stecklina <der_julian@web.de> wrote:
> Hello,
>
> I am trying to get my HP Visualize C3600 to output some sound, but
> without luck so far. Both the onboard AD1889 sound chip and a
> Soundblaster Live! PCI only produce highly distorted noises with the
> 2.6.20.1 kernel.

That "sounds" like an old alsa-on-parisc bug that I thought was fixed,
but could you try using the OSS emulation instead of native ALSA, see
if it does any better?

Thanks

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
