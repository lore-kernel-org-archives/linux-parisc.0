Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45C1649FD
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Oct 2003 16:27:59 -0600 (MDT)
Received: from gmx.at ([62.178.92.247]) by viefep15-int.chello.at
          (InterMail vM.5.01.05.17 201-253-122-126-117-20021021) with ESMTP
          id <20031010222757.USKX17534.viefep15-int.chello.at@gmx.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Sat, 11 Oct 2003 00:27:57 +0200
Message-ID: <3F87326C.2010705@gmx.at>
Date: Sat, 11 Oct 2003 00:27:56 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------060609080300000004040500"
Subject: [parisc-linux] [Fwd: Re: Repair of BM200-3601]
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

This is a multi-part message in MIME format.
--------------060609080300000004040500
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

The Mail to "Ed J.M. Veling" was bounced by a BLACKHOLE LIST filter.
So I resend it to PA-RISC group !

Bye
Christoph

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

--------------060609080300000004040500
Content-Type: message/rfc822;
 name="Re: Repair of BM200-3601"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Re: Repair of BM200-3601"


>From - Fri Oct 10 23:57:34 2003
X-Mozilla-Status2: 00800000
Message-ID: <3F872B4A.1050909@gmx.at>
Date: Fri, 10 Oct 2003 23:57:30 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
Organization: private
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.0.1) Gecko/20020830
X-Accept-Language: en-us, en
MIME-Version: 1.0
To: "Ed J.M. Veling" <Ed.Veling@CiTG.TUDelft.nl>
Subject: Re: Repair of BM200-3601
References: <3F8131B5.DD49FB72@CiTG.TUDelft.nl>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Sorry to hear that .... I also suffer, if my "old machines"
have troubles ....

Hello,
do we speak here about the same type of power supply, then I may
help you perhaps.

Ths small SIMM-lile module on the 60-pin conntector side, is a
supervision module generating the "emergency stop" signal to
the power supply, if there is a problem. Further it generates the
the RESET signal for the machine (or better the POWER GOOD signal).

As I remember the schematics, there are 6 reasons for switching
off the power supply:
Over 5V, 12V, under -5, -12V, over current and over temperature.
You have to find out, which is true here.

Check the type, and reply if you need further help ....
Christoph



Ed J.M. Veling wrote:
> Dear Christoph,
> 
> With interest I have read your contribution w.r.t. the repair of the
> BM200-3601 power supply.
> We have comparable problems: 2 power supplies have worked for 11 years and
> then suddenly
> almost at the same time they stopped. It is possible to restart these UNIX
> workstations
> but after some time, sometimes one hour, sometimes 2 days later, they stop
> again.
> By the way, these workstations are located in a air-conditioned room.
> So, I was very happy to read your suggestion to put some resistance into the
> power supply.
> At our department,  a technical person has done this repairment. Last tuesday
> I restarted the workstation
> and I was very happy to see it operating. However, after two days, I was quite
> disappointed: again,
> the workstation was dead.
> Now, you are my last resort. Do you have maybe another suggestion to keep
> these power supplies
> alive ?
> I thank you very well in advance.
> Yours sincerely,
> 
> Ed Veling
> 
> 
> 
> --
> Dr. E.J.M. Veling,
> Delft University of Technology,
> Faculty of Civil Engineering and Geosciences,
> Department of Water Management,
> Section for Hydrology and Ecology,
> Stevinweg 1,   NL-2628 CN  Delft, The Netherlands,
> P.O. Box 5048, NL-2600 GA  Delft, The Netherlands,
> phone:  (+31)152783156 ((+31)152785074),
> fax:    (+31)152785915,
> room:   4.89,
> e-mail: Ed.Veling@CiTG.TUDelft.nl
> URL:    http://hydrology.citg.tudelft.nl
> 
> 
> 
> 



-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at


--------------060609080300000004040500--
