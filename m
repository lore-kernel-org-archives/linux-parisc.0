Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id F3A67482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Aug 2002 08:12:58 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5) with ESMTP id g7OEEs72011512;
	Sat, 24 Aug 2002 15:14:55 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5/Submit) id g7OEEqho011510;
	Sat, 24 Aug 2002 15:14:52 +0100
Subject: Re: [parisc-linux] Voodoo2 (was: Question ...)
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D6707CC.6020408@charter.net>
References: <003601c24b1e$757a8120$a80251d9@PLUTO>
	<3D6707CC.6020408@charter.net>
Content-Type: text/plain
Date: 24 Aug 2002 15:14:52 +0100
Message-Id: <1030198492.9903.17.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
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

On Sat, 2002-08-24 at 05:13, B. Douglas Hilton wrote:
> Most of the HP graphics cards used this top-secret
> "color recovery technology" which used a special
> dithering method to reduce graphics data to 8bpp,
> then the card somehow restored it to 24bpp. What

The required algorithm is on the HP web site with complete C code for
doing the dither. 

http://www.hp.com/workstations/support/documentation/manuals/user_guides/graphics/GAG11/3_XWindows11.html#HPColorRecovery

Kudos to HP's manual writers. The only bits that are not directly
covered is whether the processing is automatic or we have to bang bits
on the video board to turn on the modes



unsigned char dither_pixel_for_CR(RedValue,GreenValue,BlueValue,Xp,Yp)
  int   RedValue, GreenValue, BlueValue, Xp, Yp;
{
    static short        dither_red[2][16] = {
      {-16,  4, -1, 11,-14,  6, -3,  9,-15,  5, -2, 10,-13,  7, -4,  8},
      { 15, -5,  0,-12, 13, -7,  2,-10, 14, -6,  1,-11, 12, -8,  3,
-9}};
    static short        dither_green[2][16] = {
      { 11,-15,  7, -3,  8,-14,  4, -2, 10,-16,  6, -4,  9,-13,  5, -1},
      {-12, 14, -8,  2, -9, 13, -5,  1,-11, 15, -7,  3,-10, 12, -6, 
0}};
    static short        dither_blue[2][16] = {
      { -3,  9,-13,  7, -1, 11,-15,  5, -4,  8,-14,  6, -2, 10,-16,  4},
      {  2,-10, 12, -8,  0,-12, 14, -6,  3, -9, 13, -7,  1,-11, 15, -5}
};
    int                 red, green, blue;
    int                 x_dither_table, y_dither_table;
    unsigned char       pixel;

    /* Determine the dither table entries to use based on the pixel
address */
    x_dither_table = Xp % 16;   /* X Pixel Address MOD 16 */
    y_dither_table = Yp % 2;    /* Y Pixel Address MOD 2 */

    /* Start with the initial values as supplied by the calling routine
*/
    red   = RedValue;
    green = GreenValue;
    blue  = BlueValue;

    /* Generate the red dither value */
    red += dither_red[y_dither_table][x_dither_table];
    /* Check for overflow or underflow on red value */
    if (red > 0xff) red = 0xff;
    if (red < 0x00) red = 0x00;

    /* Generate the green dither value */
    green += dither_green[y_dither_table][x_dither_table];
    /* Check for overflow or underflow on green value */
    if (green > 0xff) green = 0xff;
    if (green < 0x00) green = 0x00;

    /* Generate the blue dither value */
    blue += (dither_blue[y_dither_table][x_dither_table]<<1);
    /* Check for overflow or underflow on blue value */
    if (blue > 0xff) blue = 0xff;
    if (blue < 0x00) blue = 0x00;

    /* Generate the pixel value by "or"ing the values together */
    pixel = ((red & 0xE0) | ((green & 0xE0) >> 3) | ((blue & 0xC0) >>
6));
    return(pixel);
}

For HCRX the code is

unsigned char dither_pixel_for_CR(RedValue,GreenValue,BlueValue,Xp,Yp)
  int           RedValue,GreenValueBlueValue,Xp,Yp;
{
    static short        dither_red[2][16] = {
      {-16,  4, -1, 11,-14,  6, -3,  9,-15,  5, -2, 10,-13,  7, -4,  8},
      { 15, -5,  0,-12, 13, -7,  2,-10, 14, -6,  1,-11, 12, -8,  3,
-9}};
    static short        dither_green[2][16] = {
      { 11,-15,  7, -3,  8,-14,  4, -2, 10,-16,  6, -4,  9,-13,  5, -1},
      {-12, 14, -8,  2, -9, 13, -5,  1,-11, 15, -7,  3,-10, 12, -6, 
0}};
    static short        dither_blue[2][16] = {
      { -3,  9,-13,  7, -1, 11,-15,  5, -4,  8,-14,  6, -2, 10,-16,  4},
      {  2,-10, 12, -8,  0,-12, 14, -6,  3, -9, 13, -7,  1,-11, 15,
-5}};
    int                 red, green, blue;
    int                 x_dither_table, y_dither_table;
    unsigned char       pixel;

    /* Determine the dither table entries to use based on the pixel
address */
    x_dither_table = Xp % 16;   /* X Pixel Address MOD 16 */
    y_dither_table = Yp % 2;    /* Y Pixel Address MOD 2 */

    /* Start with the initial values as supplied by the calling routine
*/
    red   = RedValue;
    green = GreenValue;
    blue  = BlueValue;

    /* Generate the red dither value */
    if (red >= 48) /* 48 is a constant required by this routine */
       red=red-16;
    else
       red=red/2+8;
    red += dither_red[y_dither_table][x_dither_table];
    /* Check for overflow or underflow on red value */
    if (red > 0xff) red = 0xff;
    if (red < 0x00) red = 0x00;

    /* Generate the green dither value */
    if (green >= 48) /* 48 is a constant required by this routine */
       green=green-16;
    else
       green=green/2+8;
    green += dither_green[y_dither_table][x_dither_table];
    /* Check for overflow or underflow on green value */
    if (green > 0xff) green = 0xff;
    if (green < 0x00) green = 0x00;

    /* Generate the blue dither value */
    if (blue >= 112) /* 112 is a constant required by this routine */
       blue=blue-32;
    else
       blue=blue/2+24;
    blue += (dither_blue[y_dither_table][x_dither_table]<<1);
    /* Check for overflow or underflow on blue value */
    if (blue > 0xff) blue = 0xff;
    if (blue < 0x00) blue = 0x00;

    pixel = ((red & 0xE0) | ((green & 0xE0) >> 3) | ((blue & 0xC0) >>
6));
    return(pixel);
}
