From: Helge Deller <deller@gmx.de>
Subject: Re: HPPA and lenny (ruby1.9 build problems)
Date: Tue, 06 Jan 2009 17:21:59 +0100
Message-ID: <49638527.7050800@gmx.de>
References: <20081215193025.GP20002@anguilla.noreply.org> <20081215200749.GA30169@colo.lackof.org> <4949787B.9070003@gmx.de> <20081217222540.GB13477@colo.lackof.org> <4950B3AD.1020200@gmx.de> <20081223102356.GF19873@anguilla.noreply.org> <4950C0CA.1040804@gmx.de> <20090105180823.GC877@colo.lackof.org> <20090105190209.GI932@anguilla.noreply.org> <49629BDA.4030904@gmx.de> <20090106041327.GA22965@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Matt Taggart <taggart@debian.org>,
	Christoph Martin <martin@uni-mainz.de>,
	debian-hppa@lists.debian.org, debian-release@lists.debian.org,
	team@security.debian.org, debian-admin@lists.debian.org,
	lucas@lucas-nussbaum.net,
	linux-parisc <linux-parisc@vger.kernel.org>
To: dann frazier <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090106041327.GA22965@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

dann frazier wrote:
> On Tue, Jan 06, 2009 at 12:46:34AM +0100, Helge Deller wrote:
>> CC: linux-paric mailing list
>>
>> Peter Palfrader wrote:
>>> On Mon, 05 Jan 2009, dann frazier wrote:
>>>
>>>> On Tue, Dec 23, 2008 at 11:43:22AM +0100, Helge Deller wrote:
>>>>> Peter Palfrader wrote:
>>>>>> Helge Deller schrieb am Dienstag, dem 23. Dezember 2008:
>>>>>>
>>>>>>> Patch in parisc git tree:
>>>>>>> http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commitdiff;h=378fe7c4cc619b561409206605c723c05358edac;hp=6c4dfa8f8bcf032137aacb3640d7dd9d75b2b607
>>>>>> So just using an SMP kernel should also work?
>>>>> Probably yes, since some other developers tried initially to reproduce
>>>>> the problem, but they couldn't (as it seems they were running on newer
>>>>> SMP machines). But I don't have a SMP server which is why I can't test
>>>>> myself...
>>>> Unfortunately, it looks like we're still having problems on the
>>>> buildds w/ 2.6.26 SMP kernels:
>>>>   http://buildd.debian.org/build.php?&pkg=ruby1.9&ver=1.9.0.2-9&arch=hppa&file=log
>>>>
>>>> The build doesn't take the system down, but does still hang
>>>> indefinitely while running miniruby - though the hang location varies.
>>>>
>>>> I'll prepare a UP kernel for one of the buildds w/ the
>>>> up-optimization-removal patch just to see if it improves things. I
>>>> don't see why it would, other than it seemed to solve the problem on
>>>> my test box when I first tested the patch.
>> It seemed to fix the problem for me as well.
> 
> fyi, I tested w/ a 2.6.26 32-bit UP kernel w/ the
> up-optimization-removal patch, and received another hang:
>  http://buildd.debian.org/fetch.cgi?pkg=ruby1.9;ver=1.9.0.2-9;arch=hppa;stamp=1231212073

Yes, that's the same I can reproduce here as well.
It's AFAICS not the ProtectionID trap kernel bug any longer, which is good :-)

>> In principle looking at the logs it looks more like a userspace bugs
>> due to threading functions.
>> Anyway, I'll try to reproduce it here as well.
>> FWIW, I had some additional irq locking code in load_context(), maybe 
>> this helps...?
> 
> I'd be happy to test it if you can point me to a changeset.

Sorry, nothing yet.
As it does not seem to be related to the Protection ID trap, they are probably
useless anyway.
Overall, this is what I see when running dpkg-buildpackage for ruby1.9:
test_load.rb .
test_exception.rb ................................
test_thread.rb .........................
<here it hangs>

root@c3000:~/cvs/ruby/ruby1.9-1.9.0.2# ps -efww
root     15817 15815  0 13:36 pts/0    00:00:00 /usr/bin/perl /usr/bin/dpkg-buildpackage
root     25673 32222  0 14:56 pts/0    00:00:00 /mnt/sdb4/cvs/ruby/ruby1.9-1.9.0.2/miniruby -I/mnt/sdb4/cvs/ruby/ruby1.9-1.9.0.2/lib -I/mnt/sdb4/cvs/ruby/ruby1.9-1.9.0.2/.ext/common -I./- -r/mnt/sdb4/cvs/ruby/ruby1.9-1.9.0.2/ext/purelib.rb -W0 bootstraptest.tmp.rb
root     25676 25673  0 14:56 pts/0    00:00:00 [miniruby] <defunct>
root     25892  2014  0 17:16 pts/1    00:00:00 ps -efwww
root     29832 15817  0 14:46 pts/0    00:00:00 /usr/bin/make -f debian/rules binary
root     32188 29832  0 14:55 pts/0    00:00:00 make test
root     32222 32188  0 14:55 pts/0    00:00:00 ./miniruby -I./lib -I.ext/common -I./- -r./ext/purelib.rb ./bootstraptest/runner.rb --ruby=./miniruby -I./lib -I.ext/common -I./- -r./ext/purelib.rb  -q
root     32223 32222  0 14:55 pts/0    00:00:00 ./miniruby -I./lib -I.ext/common -I./- -r./ext/purelib.rb ./bootstraptest/runner.rb --ruby=./miniruby -I./lib -I.ext/common -I./- -r./ext/purelib.rb  -q
root     32224 32223  0 14:55 pts/0    00:00:00 ./miniruby -I./lib -I.ext/common -I./- -r./ext/purelib.rb ./bootstraptest/runner.rb --ruby=./miniruby -I./lib -I.ext/common -I./- -r./ext/purelib.rb  -q

root@c3000:~/cvs/ruby/ruby1.9-1.9.0.2# strace -p 32222
Process 32222 attached - interrupt to quit
_newselect(7, [6], NULL, NULL, NULL^C <unfinished ...>
Process 32222 detached

root@c3000:~/cvs/ruby/ruby1.9-1.9.0.2# strace -p 32223
Process 32223 attached - interrupt to quit
restart_syscall(<... resuming interrupted call ...>) = 0
getppid()                               = 32222
poll([{fd=3, events=POLLIN}], 1, 2000)  = 0 (Timeout)
getppid()                               = 32222
poll([{fd=3, events=POLLIN}], 1, 2000^C <unfinished ...>
Process 32223 detached

root@c3000:~/cvs/ruby/ruby1.9-1.9.0.2# strace -p 32224
Process 32224 attached - interrupt to quit
nanosleep({0, 10000000}, {0, 7191145})  = 0
nanosleep({0, 10000000}, {0, 7191145})  = 0
nanosleep({0, 10000000}, {0, 7191145})  = 0
nanosleep({0, 10000000}, {0, 7191145})  = 0
...

So, it's probably somehow a threading-related problem.
I'm not sure yet, why the miniruby PID 25676 is defunct.

Needs quite some debugging, but we still have threading problems on hppa. 

>>> Yeah, penalosa got stuck again today, this was on the console:
>> Does panalosa has the patched kernel (same one as the one on peri) ?
> 
> Both machines were running an unpatched SMP 2.6.26 until I upgraded
> penalosa for the test I refer to above. The thinking being that -
> though these machines are single CPU - the SMP version should avoid
> the UP optimization code.
> 
>> The protection ID traps shouldn't happen any longer, and from the buildd
>> logs on peri it does seem like that the ProtID traps don't happen there.
> 
> There were no protection trap messages in penalosa's dmesg after the
> above hang. In fact, it contains nothing other than bootup messages.

Good, same here.

> Thanks for all your help so far - its really appreciated.

Thanks!

Helge
