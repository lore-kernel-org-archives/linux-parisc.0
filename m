From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Git tree rebased
Date: Wed, 01 Nov 2006 14:42:18 +0000
Message-ID: <4548B24A.1010902@scarlet.be>
References: <20061031150001.GB26964@parisc-linux.org>
	<45487F41.4020509@scarlet.be>
	<20061101124125.GB11399@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061101124125.GB11399@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Matthew Wilcox wrote:
> On Wed, Nov 01, 2006 at 11:04:33AM +0000, Joel Soete wrote:
>> * refs/heads/origin: does not fast forward to branch 'master' of 
>> git://git.parisc-linux.org/git/linux-2.6;
>>   not updating.
>>
>> Any idea of what I missed?
> 
> It's THE BIT YOU JUST QUOTED!
> 
well ...
>>> If your remotes file currently has a line in it like:
>>>
trying so to translate your idea in non git expert you mean that file:
# find . -type f | xargs grep "refs/heads/master"
./.git/remotes/origin:Pull: refs/heads/master:refs/heads/origin
./.git/HEAD:ref: refs/heads/master

>>> 	Pull: refs/heads/master:refs/heads/origin
>>>
>>> then you'll want to add the '+' at the beginning:
>>>
>>> 	Pull: +refs/heads/master:refs/heads/origin
>>>
so my .git/remotes/origin looks like now:
URL: git://git.parisc-linux.org/git/linux-2.6.git
Pull: +refs/heads/master:refs/heads/origin
Pull: refs/heads/linus:refs/heads/linus
Pull: refs/heads/scsi:refs/heads/scsi

>>> otherwise git will refuse to update.  With the +, it will complain,
Ok it do something:
# git-pull 2>&1 | tee -a /var/logs/GitParisc26.log
remote: Generating pack...
remote: Done counting 1545 objects.
remote: Result has 1156 objects.
remote: Deltifying 1156 objects.
remote:  100% (1156/1156) done
Unpacking 1156 objects
remote: Total 1156, written 1156 (delta 947), reused 15 (delta 11)
* refs/heads/origin: does not fast forward to branch 'master' of git://git.parisc-linux.org/git/linux-2.6;
   forcing update.
* refs/heads/linus: fast forward to branch 'linus' of git://git.parisc-linux.org/git/linux-2.6
   from e80391500078b524083ba51c3df01bbaaecc94bb to ae99a78af33f00565a05dbbc6ca9b247fed002c5
Auto-following refs/tags/v2.6.19-rc4-pa0
Auto-following refs/tags/v2.6.19-rc4
remote: Generating pack...
remote: Done counting 2 objects.
remote: Deltifying 2 objects.
remote:  100% (2/2) done
remote: Total 2, written 2 (delta 0), reused 0 (delta 0)
Unpacking 2 objects
* refs/tags/v2.6.19-rc4-pa0: storing tag 'v2.6.19-rc4-pa0' of git://git.parisc-linux.org/git/linux-2.6
* refs/tags/v2.6.19-rc4: storing tag 'v2.6.19-rc4' of git://git.parisc-linux.org/git/linux-2.6
Trying really trivial in-index merge...
fatal: Merge requires file-level merging
Nope.
merge: warning: conflicts during merge
Merging HEAD with 1c5484420c0a451eafd30121fd1fcc62bd234f1e
Merging:
823bbec4f4c48113da0083fc8220d60748daf8ed PA-RISC: sparse fixes
1c5484420c0a451eafd30121fd1fcc62bd234f1e Enable CONFIG_LOCALVERSION_AUTO in defconfigs
found 1 common ancestor(s):
7059abedd2f04b68bd7e1a79c9c72f7aeee134c0 Linux 2.6.19-rc3
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile
Auto-merging arch/ia64/ia32/ia32_signal.c
Auto-merging arch/parisc/configs/712_defconfig
Auto-merging arch/parisc/configs/a500_defconfig
Auto-merging arch/parisc/configs/b180_defconfig
Auto-merging arch/parisc/configs/c3000_defconfig
Auto-merging arch/parisc/defconfig
Auto-merging arch/x86_64/ia32/ia32_signal.c
Removing include/asm-i386/mach-visws/do_timer.h
Auto-merging include/linux/compat.h
Auto-merging kernel/compat.c
Automatic merge failed; fix conflicts and then commit the result.

 >>> but do it anyway.

root@sidh:/Develop/parisc-linux/parisc-2.6 # head Makefile
VERSION = 2
PATCHLEVEL = 6
SUBLEVEL = 19
<<<<<<< HEAD/Makefile
EXTRAVERSION =-rc3-pa0
=======
EXTRAVERSION =-rc4
 >>>>>>> 1c5484420c0a451eafd30121fd1fcc62bd234f1e/Makefile
NAME=Avast! A bilge rat!


And now what am I supposed to do with this 'conflictual' file in my local git tree?

(I know what I have to do if I want to use this file to build the kernel but what's up for the next git-pull?)

Joel
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
