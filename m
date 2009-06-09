From: Helge Deller <deller@gmx.de>
Subject: Re: HPPA and Squeeze
Date: Tue, 09 Jun 2009 21:11:34 +0200
Message-ID: <4A2EB3E6.9080302@gmx.de>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org> <20090608212606.GC19894@halon.org.uk> <7d01f9f00906081644s5d3e873ct887bf4fd777d55ec@mail.gmail.com> <slrnh2scj5.720.nospam@sshway.ssh.pusling.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org
To: Sune Vuorela <nospam@vuorela.dk>,
 John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Neil McGovern <maulkin@halon.org.uk>,
 linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <slrnh2scj5.720.nospam@sshway.ssh.pusling.com>
Resent-Message-ID: <7fLDdxNTb3M.A.OIC.3PrLKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Hi Sune, all,

Sune Vuorela wrote:
> On 2009-06-08, Thibaut VARENE <varenet@debian.org> wrote:
>> Failing this, could we please have a detailed rationale for the
>> decision?
> 
> I'm not in any way involved with the decision, but I support it.
> 
> I have in the past had some issues with some of the packages I
> (co)-maintain in debian on hppa, and I have in the past spent much more
> time on those packages on hppa than its userbase deserve. And I'm not a
> hppa porter.

Yes, there have been issues.

> I personally don't mind that we in debian supports many architectures,
> but it should mainly be the porters who are responsible for fixing
> architecture weirdnesses, not the package maintainers.

Sure.
 
> I have really missed this from the hppa porters. It might be that hppa
> porters don't care for Qt on hppa. It might be that hppa porters don't
> care for KDE on hppa. 

I think that's not fair.
I'm a big KDE and Qt fan and when you reported the issues, I stepped in.

You had problems with the locking functions in Qt. I did sent you
fixes for that to fix it in the qt code base.
This was one of the threads:  http://www.mail-archive.com/debian-hppa@lists.debian.org/msg05888.html
I have to admit, that I didn't checked if you integrated them yet, but since I didn't heard back, I expected you did.

Then, as a next step we stepped up to fix those Qt locking functions
at the place where they really needed to be fixed in the end, which is the gcc as atomic locking builtins.
Even this was integrated upstream:
http://permalink.gmane.org/gmane.comp.gcc.patches/166978

> But. As long as hppa is a release architecture in
> Debian, we have to have it working. And I have expected more help than I
> actually got.
> 
> There has in the past 6-8 month been random segfaults of
> anything from make over moc to dpkg on the hppa buildds making it hard
> to get stuff built. It doesn't seem like anyone have actually worked on
> this, except the buildd admin giving the packages back and next time
> they succeeded.

Sometimes finding kernel bugs isn't easy.
I wouldn't be astonished, if this patch fixes those issues:
http://patchwork.kernel.org/patch/28458/
It still is on discussion on the hppa-kernel-list.

> It seems that the buildd's have issues with actually being on line, and
> it can take 1-3 days for the buildd admins to actually notice this.
> 
> Up to the lenny release there was the "you can crash a hppa machine by
> building ruby"-issue, where the suggested solution was "Let's not ship
> ruby and instead let anyone with a account crash our boxes".

The kernel crash was finally fixed by:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=c61c25eb02757ecf697015ef4ae3675c5e114e2e
 
> And in general, I have the impression that "random unexplainable
> failures" is just too common for hppa to actually be able to support it
> in debian. And I also have the impression that the porters think that
> "random unexplainable failures" is fully acceptable.

No, it's not.
Again, kernel bugs are sometimes hard to find.
I still think that http://patchwork.kernel.org/patch/28458/ may fix a few.
The only outstanding bug I still know of is that we sometimes face uid/gid issues.
This still needs analysis.

All that said, personally I'm currently really happy about the hppa unstable port.
I'm regularly compiling some really big closed-source application on this platform
and gcc-3.4 and gij-4.4 are doing a really good thing. Furthermore, the already started
migration to NPTL (from linuxthreads) is great, from which I expect even better results.
For me hppa unstable is currently in such a good shape in which it hasn't been up to now.
So, dropping it now at _this_ _stage_ from unstable would be really sad after such a long 
(and imho sucessful) way.

Best regards,
Helge
