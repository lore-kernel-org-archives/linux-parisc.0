Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep11-int.chello.at (viefep11-int.chello.at [213.46.255.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id C10A348C1
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Aug 2003 15:43:55 -0600 (MDT)
Received: from gmx.at ([62.178.92.247]) by viefep11-int.chello.at
          (InterMail vM.5.01.05.17 201-253-122-126-117-20021021) with ESMTP
          id <20030821214352.QELL2268.viefep11-int.chello.at@gmx.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Thu, 21 Aug 2003 23:43:52 +0200
Message-ID: <3F453D16.8080708@gmx.at>
Date: Thu, 21 Aug 2003 23:43:50 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------070102000107000003020209"
Subject: [parisc-linux] [Fwd: Re: Apollo 9000 power problem]
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
--------------070102000107000003020209
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

So for all in the PARISC group !

I sent this file to MR. Gabert last week.

Here some INPORTANT points:

- I take no warranty in all cases !
- You do the repair on your own risk (for me it was a good solution)
- Check the type of the power supply
	My was a ASTEC Model BM200-3601

- Have fun on testing ...


Bye
Christoph P.


-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

--------------070102000107000003020209
Content-Type: message/rfc822;
 name="Re: Apollo 9000 power problem"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Re: Apollo 9000 power problem"


>From - Thu Aug 14 00:14:28 2003
X-Mozilla-Status2: 00800000
Message-ID: <3F3AB83F.3000408@gmx.at>
Date: Thu, 14 Aug 2003 00:14:23 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
Organization: private
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.0.1) Gecko/20020830
X-Accept-Language: en-us, en
MIME-Version: 1.0
To: Alexander Gabert <pappy@nikita.ath.cx>
Subject: Re: Apollo 9000 power problem
References: <3F32CB8C.9060407@gmx.at> <20030807220208.GA31556@nikita.ath.cx> <3F32CE0B.30902@gmx.at> <20030807223043.GA3631@nikita.ath.cx>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
so here the thing you have to do to repair ...

... but before some words:

	- 1 -  I take no warranty to nothing - the hack works for
		well, you can try it.

	- 2 -  My power supply so of the type ASTEC Model BM200-3601
		check the label on the power-supply not to hack around
		on the wrong thing !!

Pull out the power-supply an disconnect the power. Wait for one minute
to have unloaded the capacitors in it after unplugging it from supply.

Unscrew and open power supply. Take out the main board of the supply.
4 Screws have to be opened:


    +----------------------------------------------------------+--
    | O                                                      O |
    |                                                          |
    |                                                          |
    +--+                                                       |low
    |  |                         O                             |voltage
    |  |                                                       |side
    +--+                                                       |
    |                                                        O |
    +----------------------------------------------------------+--	

Remeber the screws, 2 of them do a GROUND connection (the upper 2
on my figure above).

After having the board in the hand, turn around, we only have to
work on the bottom side (soldering side).

The fix has to be done on the low voltage side near the 60-pin
connector. Beside the 60-pin connector, there is this SIMM-like
module, the supervision module. Exactly on the solder side of this
module (bottom side of supply main board) we have to solder on
this resistor.

                         SIMM-like Module on other side
                        /
    ----------------+  /
                    | v	           BOTTOM VIEW !!!
                    +--------------+
                        o     O    |
                        o          |
                  /->O             |
                 /   O             |
                /    O        o   o|  60-pin conector
                |    O   o    o   o| <-----
                |           o o   o|
                |             o   o|
               +-+   O      o o   o|
           220K| |   O      o o   o|
               | |   O        o   o|
               +-+   O      o o   o|
                |    O        o   o|
                |    O        o   o|
                \    O      o o   o|
                 \-->O        o   o|
                     O      o o   o|
                     O        o   o|
                              o   o|
                              o   o|
                              o   o|
                              o   o|
                              o   o|
                            o o   o|
                              o   o|
                            o o   o|
                              o   o|
                     O        o   o|

                            etc ...


Simple solder on this Resistor (220kOhms works for me) between pin-1 and
pin-12 of the SIMM-like module.

Reassemble the powersuplly and it should work !!

BTW: I use something like "Schrumpfschlauch" (the english word ?) on
both connections of the resistor not to have contact to other pins or
the metallic case !!

Good luck,
Christoph.








Alexander Gabert wrote:
> hi,
> 
> i live in Bavaria, Germany, about 1 hour to salzburg...
> and another 2-3 hours to vienna.
> and i would really bring you some good wine or beer if we could do that
> together caus i have really two left hands when it comes to soldering
> around on power supplies :-)
> 
> bye,
> 
> Alex
> 
> On Fri, Aug 08, 2003 at 12:09:15AM +0200, Christoph Plattner wrote:
> 
>>Where do ylu live, what is "cx" ?
>>
>>I live in Vienna !
>>
>>But I do not think it is necessary, that you come.
>>I can make you a small graohic in the mail, where to solder
>>this only one resistor, and which value it should have ...
>>
>>Further it is very simple to open the power supply -
>>but please disconnect the power, I am not responsible for you ...
>>
>>Some minutes ago, I switched on my Apollo, it was for many
>>months now, and it booted up without any problem ....
>>
>>If you are interested, I send you this tomorrow, now is is late
>>to pull out the supply and open it ...
>>
>>Bye
>>Christoph
>>
>>
>>
>>
>>
>>Alexander Gabert wrote:
>>
>>>hi,
>>>
>>>where in austria do you live?
>>>
>>>could i visit you with one of my broken power supplies and bring some
>>>beer for you to repair it for me?
>>>
>>>TIA,
>>>
>>>Alex
>>>
>>>On Thu, Aug 07, 2003 at 11:58:36PM +0200, Christoph Plattner wrote:
>>>
>>>
>>>>Hello HP Hackers !
>>>>
>>>>I have a work around for the POWER SUPPLY Problem.
>>>>
>>>>Using schematics and analysing this very very hard thing,
>>>>I found out, that the problem we all have was created
>>>>by an exploded capacitor.
>>>>
>>>>The thing running out of the capacitor mixed with the dust
>>>>in the machine generates an resistor on the PCB board.
>>>>
>>>>On the low voltage end of the power supply (near front),
>>>>ther is a small SIM-like module which does the supervision of
>>>>all volatage lines (plus over current protection) and which
>>>>generates the reset impuls.
>>>>
>>>>Now to the problem. The line coming from the current measure
>>>>transformer is the neighbour line of the -12V line. Because
>>>>of the electrical resistor because of the dust, etc, the
>>>>negative voltage comes to the current supervision line, and
>>>>therefore one supervision comperator does a wrong failure
>>>>reaction !
>>>>
>>>>Workaround:
>>>>
>>>>- step 1 -
>>>>Try to clean the space on the PCB around this supervison module.
>>>>(I soldered it out for cleaning, a resoldered it in)..
>>>>
>>>>- step 2 -
>>>>This helps. But after weeks the problem returned again ....
>>>>I soldered in a resistor between the +Vaux (about 12..16V)
>>>>and this current measure line to compensate this negativ
>>>>voltage of the -12V line.
>>>>This is no relevant impact to the over-current protection,
>>>>as the resistor has a high value against the measurement
>>>>output.
>>>>
>>>>This worked for me.
>>>>If you need help on this, please contact me ...
>>>>
>>>>Christoph
>>>>
>>>>
>>>>
>>>>
>>>>-- 
>>>>-------------------------------------------------------
>>>>private:	christoph.plattner@gmx.at
>>>>company:	christoph.plattner@alcatel.at
>>>>
>>>
>>>
>>
>>
>>-- 
>>-------------------------------------------------------
>>private:	christoph.plattner@gmx.at
>>company:	christoph.plattner@alcatel.at
>>
> 
> 



-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at


--------------070102000107000003020209--
