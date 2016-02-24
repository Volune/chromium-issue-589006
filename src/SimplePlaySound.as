package {
import flash.display.Sprite;
import flash.events.SampleDataEvent;
import flash.media.Sound;
import flash.utils.ByteArray;
import flash.utils.setTimeout;

[SWF(width="200", height="200", frameRate="24")]
public class SimplePlaySound extends Sprite {

    public function SimplePlaySound() {
        setTimeout(start, 100);
    }

    private static function start():void {
        var sound:Sound = new Sound();
        sound.addEventListener(SampleDataEvent.SAMPLE_DATA, sampleDataHandler);
        sound.play();
    }

    private static function sampleDataHandler(event:SampleDataEvent):void {
        var position:Number = event.position;
        var data:ByteArray = event.data;
        for ( var c:int=0; c<8192; c++ ) {
            data.writeFloat( Math.sin((Number(c+ position)/Math.PI/2))*0.25 );
            data.writeFloat( Math.sin((Number(c+position)/Math.PI/2))*0.25 );
        }
    }
}
}
