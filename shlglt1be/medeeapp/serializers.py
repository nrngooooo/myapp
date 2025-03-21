from rest_framework import serializers
from .models import Medee, MedeeTurul

class MedeeTurulSerializer(serializers.ModelSerializer):
    class Meta:
        model = MedeeTurul
        fields = '__all__'

class MedeeSerializer(serializers.ModelSerializer):
    turul = MedeeTurulSerializer(read_only=True)
    zurag = serializers.ImageField(use_url=True)
    class Meta:
        model = Medee
        fields = '__all__'
    def create(self, validated_data):
        turul_data = validated_data.pop('turul', None)
        if turul_data:
            validated_data['turul'] = turul_data
        return Medee.objects.create(**validated_data)
