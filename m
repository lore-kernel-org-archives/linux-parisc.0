From: Fabio Bizzi <bizzi@albacom.net>
Subject: Re: Strange compiler behavior
Date: Wed, 30 Nov 2005 11:08:20 +0100
Message-ID: <438D7A14.3000708__41598.7141350799$1416624569$gmane$org@albacom.net>
References: <438D64F0.7080307@albacom.net> <438D70C4.4080003@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@parisc-linux.org>,
 debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <438D70C4.4080003@tausq.org>
Resent-Message-ID: <7lsHKB.A.MGB.zoXjDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Hi Randolph

Randolph Chung wrote:
> Looks like you found a gcc bug. What happened is that g++ crashed
> (SIGSEGV) while processing your file.
> 
> It seems to be only in g++-3.3. I tried with g++-3.3 and g++-4.0.2 and
> can not reproduce the problem.
[...]
> Perhaps you can try a newer gcc, or file a bug upstream with the gcc
> developers. See http://gcc.gnu.org/bugs.html

Thank you for the help Randolph!!! :)

I've installed g++-3.4 from sarge archives, now I have another problem.
When I try to compile the same source with the correct string and 
includes I get a lot of undefined references, I suppose that it is due 
because LiveMedia libraries was compiled with g++3.3.5 (The default 
sarge compiler).

How can I test it?

Can I download the source code of LiveMedia and compile it from scratch 
with 3.4 g++ and do again the test with new liblivemdia.a library?

Thank You again!

Ciao.

	Fabio.


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
