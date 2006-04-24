From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re:Added clobbers to unaligned.c and uaccess.h
Date: Mon, 24 Apr 2006 18:49:06 +0200
Message-ID: <IY8K1U$8FE099F66A8462E832C7AFDC38E1A3E1@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "carlos" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Joel,
> 
> Patch to add the extra clobbers checked into CVS.
> Thanks for all the work!
> 
No, sincerely thanks for your help.

> What's your next project? ;-)
> 
No clue for the moment: I very need some break but a lot of idea:
    * glibc float nan values pb?
    * find an easy way to instrument of chunk of kernel code with e.g. re=
layfs
      (that was working) but builtin gcc stuff doesn't seems to be tested=
 a
       lot)?
    * ccio-dma imho need more for 64bit?
    * palo -> grub (seems to be friend but not easy to merge)?
    * finishing a ruby script to build tool chain (something is already
      working but need some cleanup and strengthening)?
    * ...

btw: just as game, I rebuild glibc-2.3.6 + my clone patch with gcc-4.1 an=
d
with same src and same kernel (results vary a very few with kernel releas=
e?),
I didn't noticed any regression versus the build with gcc-4.0 ;-)

Thanks,
    Joel=0A=0A----------=0AWordt ook lid van de Scarlet Club via een best=
aande Scarlet klant en ontvang cadeaucheques twv EUR 50! Bezoek snel http=
://www.scarletclub.be=0ADevenez aussi membre du Club Scarlet via un clien=
t Scarlet existant et recevez des cheques cadeaux jusqu'a EUR 50! Surfez =
vite sur http://www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
